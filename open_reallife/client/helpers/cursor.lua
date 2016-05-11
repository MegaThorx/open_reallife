Cursor = {}

Cursor.Show = function()
  showCursor(true)
  toggleAllControls(true)
  focusBrowser(GUI.browser)
end

Cursor.Hide = function()
  showCursor(false)
  toggleAllControls(false)
  focusBrowser(nil)
end

Cursor.IsCursorsShowing = function()
  return isCursorShowing()
end
