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

    @subscriptions.add atom.commands.add 'atom-workspace', 'multi-cursor:expandDown': => @expandDown()
    @subscriptions.add atom.commands.add 'atom-workspace', 'multi-cursor:expandUp': => @expandUp()
    @subscriptions.add atom.commands.add 'atom-workspace', 'multi-cursor:skipDown': => @skipDown()
    @subscriptions.add atom.commands.add 'atom-workspace', 'multi-cursor:skipUp': => @skipUp()

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
