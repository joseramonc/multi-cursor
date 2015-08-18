{CompositeDisposable} = require 'atom'
{Point} = require 'atom'

module.exports = MultiCursor =
  subscriptions: null
  editor: null
  firstActivation: true
  firstBuffer: null
  currentPosition: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-text-editor', 'multi-cursor:expandDown': => @expandDown()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'multi-cursor:expandUp': => @expandUp()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'multi-cursor:skipDown': => @skipDown()
    @subscriptions.add atom.commands.add 'atom-text-editor', 'multi-cursor:skipUp': => @skipUp()

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

  updateBuffer: ->
    @editor = atom.workspace.getActiveTextEditor()
    if !@editor.hasMultipleCursors() and @firstActivation
      # if the first activation is expanding up or down
      @currentPosition = @editor.getCursorBufferPosition()
    else
      @firstActivation = true

  updateSkipBuffer: ->
    @editor = atom.workspace.getActiveTextEditor()
    if !@editor.hasMultipleCursors() and @firstActivation
      # if first activation is for skipping
      @firstActivation = false
      @currentPosition = @editor.getCursorBufferPosition()

  skipDown: ->
    @updateSkipBuffer()
    @currentPosition = new Point(@currentPosition.row + 1, @currentPosition.column)

  skipUp: ->
    @updateSkipBuffer()
    @currentPosition = new Point(@currentPosition.row - 1, @currentPosition.column)

  expandDown: ->
    @updateBuffer()
    @currentPosition = new Point(@currentPosition.row + 1, @currentPosition.column)
    @editor.addCursorAtBufferPosition(@currentPosition)
    @editor.scrollToBufferPosition(@currentPosition)

  expandUp: ->
    @updateBuffer()
    @currentPosition = new Point(@currentPosition.row - 1, @currentPosition.column)
    @editor.addCursorAtBufferPosition(@currentPosition)
    @editor.scrollToBufferPosition(@currentPosition)

  moveLastCursorUp: ->
    editor = atom.workspace.getActiveTextEditor();
    editor.getLastCursor().moveUp()
    editor.mergeCursors()

  moveLastCursorDown: ->
    editor = atom.workspace.getActiveTextEditor();
    editor.getLastCursor().moveDown()
    editor.mergeCursors()

  moveLastCursorLeft: ->
    editor = atom.workspace.getActiveTextEditor();
    editor.getLastCursor().moveLeft()
    editor.mergeCursors()

  moveLastCursorRight: ->
    editor = atom.workspace.getActiveTextEditor();
    editor.getLastCursor().moveRight()
    editor.mergeCursors()
