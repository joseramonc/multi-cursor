# Multi-cursor package

An atom package to easily create more cursors with keystrokes.

![Multi-cursor demo](https://s3.amazonaws.com/f.cl.ly/items/2X393M1u1G0K0Z061O00/multi-cursor.gif)

Default keymaps are:

* **Creating cursors**
  * <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>cmd</kbd> + <kbd>up</kbd> = Create cursor above
  * <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>cmd</kbd> + <kbd>down</kbd> = Create cursor under
  * <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>cmd</kbd> + <kbd>left</kbd> = The next cursor will skip 1 line above
  * <kbd>alt</kbd> + <kbd>shift</kbd> + <kbd>cmd</kbd> + <kbd>right</kbd> = The next cursor will skip 1 line under
* **Moving the last cursor that has been created**
  * <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>cmd</kbd> + <kbd>up</kbd> = Move the last-created cursor up
  * <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>cmd</kbd> + <kbd>down</kbd> = Move the last-created cursor down
  * <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>cmd</kbd> + <kbd>left</kbd> = Move the last-created cursor left
  * <kbd>alt</kbd> + <kbd>ctrl</kbd> + <kbd>shift</kbd> + <kbd>cmd</kbd> + <kbd>right</kbd> = Move the last-created cursor right

Those may be overriden for your favorite keystroke in your `keymap.cson`

Bugs, feature requests and comments are more than welcome in the [issues](https://github.com/joseramonc/multi-cursor/issues) :tada:
