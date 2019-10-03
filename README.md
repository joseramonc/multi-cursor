# Multi-cursor package

An atom package to easily create more cursors with keystrokes.

![Multi-cursor demo](https://s3.amazonaws.com/f.cl.ly/items/2X393M1u1G0K0Z061O00/multi-cursor.gif)

## OSX Keymaps:
* **Creating cursors**
  * <kbd>alt</kbd> + <kbd>up</kbd> = Create cursor above
  * <kbd>alt</kbd> + <kbd>down</kbd> = Create cursor under
  * <kbd>Cmd</kbd> + <kbd>shift</kbd> + L = Create one cursor for each selected line <sup>[1](#footnote1)</sup>
* **Moving the last cursor that has been created**
  * <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>up</kbd> = Move the last-created cursor up
  * <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>down</kbd> = Move the last-created cursor down
  * <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>left</kbd> = Move the last-created cursor left
  * <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>right</kbd> = Move the last-created cursor right

## Linux Keymaps:

* **Creating cursors**
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>up</kbd> = Create cursor above
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>down</kbd> = Create cursor under
  * [Custom keymap can be defined for](https://github.com/atom/atom/issues/6427): Create one cursor for each selected line <sup>[1](#footnote1)</sup>
* **Moving the last cursor that has been created**
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>alt</kbd> + <kbd>up</kbd> = Move the last-created cursor up
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>alt</kbd> + <kbd>down</kbd> = Move the last-created cursor down
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>alt</kbd> + <kbd>left</kbd> = Move the last-created cursor left
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>alt</kbd> + <kbd>right</kbd> = Move the last-created cursor right


## Windows Keymaps:

* **Creating cursors**
  * <kbd>alt</kbd> + <kbd>up</kbd> = Create cursor above
  * <kbd>alt</kbd> + <kbd>down</kbd> = Create cursor under
  * [Custom keymap can be defined for](https://github.com/atom/atom/issues/6427): Create one cursor for each selected line <sup>[1](#footnote1)</sup>
* **Moving the last cursor that has been created**
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>alt</kbd> + <kbd>up</kbd> = Move the last-created cursor up
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>alt</kbd> + <kbd>down</kbd> = Move the last-created cursor down
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>alt</kbd> + <kbd>left</kbd> = Move the last-created cursor left
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>alt</kbd> + <kbd>right</kbd> = Move the last-created cursor right


## Custom Keymaps:

The default keymaps may be overriden for your favorite keystroke in your `keymap.cson` with:

```
'atom-workspace atom-text-editor:not([mini])':
  # you may have to unset the keybinding if it's already in use.

  # Expand last cursor
  'ctrl-down': 'multi-cursor:expand-down'
  'ctrl-up':   'multi-cursor:expand-up'

  # Expand all Cursors
  'ctrl-cmd-down': 'multi-cursor:expand-all-down'
  'ctrl-cmd-up':   'multi-cursor:expand-all-up'

  # Move the last cursor.
  'ctrl-alt-down':  'multi-cursor:move-last-cursor-down'
  'ctrl-alt-right': 'multi-cursor:move-last-cursor-right'
  'ctrl-alt-left':  'multi-cursor:move-last-cursor-left'
  'ctrl-alt-up':    'multi-cursor:move-last-cursor-up'

# Create one cursor for each selected line.
# Note: Mac keybindings ship with Atom out-the-box, for windows and linux you may wish to add the following,
# compare https://github.com/atom/atom/issues/6427
'.platform-win32 atom-text-editor:not([mini])':
    'ctrl-shift-l': 'editor:split-selections-into-lines'
'.platform-linux atom-text-editor:not([mini])':
    'ctrl-shift-l': 'editor:split-selections-into-lines'
```

Bugs, feature requests and comments are more than welcome in the [issues](https://github.com/joseramonc/multi-cursor/issues) :tada:


---

<a name="footnote1">1</a>: The command for creating one cursor for each selected line is provided by Atom out-of-the-box under the name "Editor: Split Selections into Lines".
