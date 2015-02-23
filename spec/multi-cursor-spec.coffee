MultiCursor = require '../lib/multi-cursor'
{WorkspaceView} = require 'atom'

# Use the command `window:run-package-specs` (cmd-alt-ctrl-p) to run specs.
#
# To run a specific `it` or `describe` block add an `f` to the front (e.g. `fit`
# or `fdescribe`). Remove the `f` to unfocus the block.

describe "MultiCursor", ->
  [workspaceElement, view, activationPromise] = []

  beforeEach ->
    workspaceElement = atom.views.getView(atom.workspace)
    view = atom.workspace.openSync('spec/files/test.txt')
    view.setCursorBufferPosition([0,0])
    activationPromise = atom.packages.activatePackage('multi-cursor')

  describe "when the multi-cursor:expandDown event is triggered", ->
    it "When there's 1 cursor and down command is activated", ->
      jasmine.attachToDOM(workspaceElement)

      waitsForPromise ->
        activationPromise

      runs ->
        expect(view.getCursors().length).toBe(1)
        atom.commands.dispatch workspaceElement, 'multi-cursor:expandDown'
        expect(view.getCursors().length).toBe(2)
