GUIWindow = {}
GUIWindow.lastIndex = 0

GUIWindow.Create = function(x, y, width, height, titleBarText)
  local windowId = GUIWindow.GetId()
  local dialogTemplate = '<div id=\\"'..windowId..'\\" title=\\"'..titleBarText..'\\"></div>'

  executeBrowserJavascript(GUI.browser, '$("#windows").append("'..dialogTemplate..'");')
  executeBrowserJavascript(GUI.browser, '$("#'..windowId..'").dialog();')

  return windowId
end

GUIWindow.GetId = function()
  GUIWindow.lastIndex = GUIWindow.lastIndex + 1
  return "window-"..GUIWindow.lastIndex
end
