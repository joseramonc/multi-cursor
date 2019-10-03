{CompositeDisposable} = require 'atom'
{Point} = require 'atom'

module.exports = MultiCursor =
  subscriptions: null
  editor: null
  firstActivation: true
  firstBuffer: null
  currentPosition: null
  skipCount: 0

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-text-editor', 'multi-cursor:expand-down': => @expandDown()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'multi-cursor:expand-up': => @expandUp()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'multi-cursor:expand-all-up': => @expandAllUp()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'multi-cursor:expand-all-down': => @expandAllDown()

    @subscriptions.add atom.commands.add 'atom-text-editor', 'multi-cursor:move-last-cursor-up': => @moveLastCursorUp()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'multi-cursor:move-last-cursor-down': => @moveLastCursorDown()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'multi-cursor:move-last-cursor-left': => @moveLastCursorLeft()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'multi-cursor:move-last-cursor-right': => @moveLastCursorRight()

  deactivate: ->
    @subscriptions.dispose()
    @currentPosition = null
    @firstBuffer = null
    @editor = null

  serialize: ->
    @currentPosition = null

  expandDown: ->
    @expandInDirection(1)

  expandUp: ->
    @expandInDirection(-1)

  expandAllUp: ->
    return unless editor = atom.workspace.getActiveTextEditor()
    return unless lastCursor = editor.getLastCursor()
    cursors = editor.getCursors()
    coords = lastCursor.getBufferPosition()

    for line in [1..coords.row]
      @expandUp()

  expandAllDown: ->
    return unless editor = atom.workspace.getActiveTextEditor()
    return unless lastCursor = editor.getLastCursor()
    cursors = editor.getCursors()
    coords = lastCursor.getBufferPosition()

    for line in [coords.row..editor.getLineCount()]
      @expandDown()

  expandInDirection: (dir) ->
    return unless editor = atom.workspace.getActiveTextEditor()
    return unless lastCursor = editor.getLastCursor()
    cursors = editor.getCursors()
    coords = lastCursor.getBufferPosition()

    newCoords = { column: lastCursor.goalColumn || coords.column, row: coords.row + dir + @skipCount }
    return if newCoords.row < 0 or newCoords.row > editor.getLastBufferRow()

    newCursor = editor.addCursorAtBufferPosition(newCoords)
    newCursor.goalColumn = lastCursor.goalColumn || coords.column

    if cursors.length is editor.getCursors().length
      # no cursor was added so we tried to add a cursor where there is one already
      lastCursor.destroy() if editor.hasMultipleCursors()

    @skipCount = 0

  moveLastCursorUp: ->
    @skipCount = 0
    return unless editor = atom.workspace.getActiveTextEditor()
    return unless cursor = editor.getLastCursor()
    if cursor.selection.isEmpty()
      cursor.moveUp()
    else
      cursor.selection.modifySelection -> cursor.moveUp()
    editor.mergeCursors()

  moveLastCursorDown: ->
    @skipCount = 0
    return unless editor = atom.workspace.getActiveTextEditor()
    return unless cursor = editor.getLastCursor()
    if cursor.selection.isEmpty()
      cursor.moveDown()
    else
      cursor.selection.modifySelection -> cursor.moveDown()
    editor.mergeCursors()

  moveLastCursorLeft: ->
    @skipCount = 0
    return unless editor = atom.workspace.getActiveTextEditor()
    return unless cursor = editor.getLastCursor()
    if cursor.selection.isEmpty()
      cursor.moveLeft()
    else
      cursor.selection.modifySelection -> cursor.moveLeft()
    editor.mergeCursors()

  moveLastCursorRight: ->
    @skipCount = 0
    return unless editor = atom.workspace.getActiveTextEditor()
    return unless cursor = editor.getLastCursor()
    if cursor.selection.isEmpty()
      cursor.moveRight()
    else
      cursor.selection.modifySelection -> cursor.moveRight()
    editor.mergeCursors()
