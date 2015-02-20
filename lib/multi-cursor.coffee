{CompositeDisposable} = require 'atom'
{Point} = require 'atom'

module.exports = MultiCursor =
  subscriptions: null
  editor: null
  lastBuffer: null

  activate: (state) ->
    # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
    @subscriptions = new CompositeDisposable

    @subscriptions.add atom.commands.add 'atom-workspace', 'multi-cursor:expandDown': => @expandDown()
    @subscriptions.add atom.commands.add 'atom-workspace', 'multi-cursor:expandUp': => @expandUp()

  deactivate: ->
    @subscriptions.dispose()
    @lastBuffer = null
    @editor = null

  serialize: ->
    @lastBuffer = null

  updateBuffer: ->
    @editor = atom.workspace.getActiveTextEditor()
    if !@editor.hasMultipleCursors()
      @lastBuffer = @editor.getCursorBufferPosition()

  expandDown: ->
    @updateBuffer()
    @lastBuffer = new Point(@lastBuffer.row + 1, @lastBuffer.column)
    @editor.addCursorAtBufferPosition(@lastBuffer)

  expandUp: ->
    @updateBuffer()
    @lastBuffer = new Point(@lastBuffer.row - 1, @lastBuffer.column)
    @editor.addCursorAtBufferPosition(@lastBuffer)
