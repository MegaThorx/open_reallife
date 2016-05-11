GUITextBox = {}
GUITextBox.lastIndex = 0

GUITextBox.Create = function(x, y, width, height, parent)
  local textboxId = GUITextBox.GetId()
  local template = '<input type=\\"text\\" id=\\"'..textboxId..'\\">'

  executeBrowserJavascript(GUI.browser, '$("#'..parent..'").append("'..template..'");')
end

GUITextBox.GetId = function()
  GUITextBox.lastIndex = GUITextBox.lastIndex + 1
  return "textbox-"..GUITextBox.lastIndex
end
