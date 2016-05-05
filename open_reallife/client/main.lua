screenX, screenY = guiGetScreenSize()

addEventHandler("onClientResourceStart", resourceRoot, function()
  setDevelopmentMode(true, true)
  GUI.Init()
  HUD.Init()
end)

bindKey("m", "down", function()
  showCursor(not isCursorShowing(), true)
end)
