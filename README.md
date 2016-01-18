# Multi-cursor package

An atom package to easily create more cursors with keystrokes.

![Multi-cursor demo](https://s3.amazonaws.com/f.cl.ly/items/2X393M1u1G0K0Z061O00/multi-cursor.gif)

## OSX Keymaps:
* **Creating cursors**
  * <kbd>alt</kbd> + <kbd>up</kbd> = Create cursor above
  * <kbd>alt</kbd> + <kbd>down</kbd> = Create cursor under
* **Moving the last cursor that has been created**
  * <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>up</kbd> = Move the last-created cursor up
  * <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>down</kbd> = Move the last-created cursor down
  * <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>left</kbd> = Move the last-created cursor left
  * <kbd>ctrl</kbd> + <kbd>alt</kbd> + <kbd>right</kbd> = Move the last-created cursor right

## Linux Keymaps:

* **Creating cursors**
  * <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>up</kbd> = Create cursor above
  * <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>down</kbd> = Create cursor under
* **Moving the last cursor that has been created**
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>alt</kbd> + <kbd>up</kbd> = Move the last-created cursor up
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>alt</kbd> + <kbd>down</kbd> = Move the last-created cursor down
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>alt</kbd> + <kbd>left</kbd> = Move the last-created cursor left
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>alt</kbd> + <kbd>right</kbd> = Move the last-created cursor right


## Windows Keymaps:

* **Creating cursors**
  * <kbd>alt</kbd> + <kbd>up</kbd> = Create cursor above
  * <kbd>alt</kbd> + <kbd>down</kbd> = Create cursor under
* **Moving the last cursor that has been created**
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>alt</kbd> + <kbd>up</kbd> = Move the last-created cursor up
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>alt</kbd> + <kbd>down</kbd> = Move the last-created cursor down
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>alt</kbd> + <kbd>left</kbd> = Move the last-created cursor left
  * <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>alt</kbd> + <kbd>right</kbd> = Move the last-created cursor right

Those may be overriden for your favorite keystroke in your `keymap.cson` with:

```
'atom-workspace atom-text-editor:not([mini])':
  # you may have to unset the keybinding if it's already in use.

  # Expand current cursor
  'ctrl-down': 'multi-cursor:expandDown'
  'ctrl-up':   'multi-cursor:expandUp'

  # Move the last cursor.
  'ctrl-alt-down':  'multi-cursor:move-last-cursor-down'
  'ctrl-alt-right': 'multi-cursor:move-last-cursor-right'
  'ctrl-alt-left':  'multi-cursor:move-last-cursor-left'
  'ctrl-alt-up':    'multi-cursor:move-last-cursor-up'
```

Bugs, feature requests and comments are more than welcome in the [issues](https://github.com/joseramonc/multi-cursor/issues) :tada:
