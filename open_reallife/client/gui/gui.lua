GUI = {}

GUI.Init = function()
  GUI.browser = createBrowser(screenX, screenY, true, true)

  addEventHandler("onClientClick", root,
  	function(button, state)
  	if state == "down" then
  		injectBrowserMouseDown(GUI.browser, button)
  	else
  		injectBrowserMouseUp(GUI.browser, button)
  	end
  end)

  addEventHandler("onClientKey", root, function(button)
  	if button == "mouse_wheel_down" then
  		injectBrowserMouseWheel( GUI.browser, -40, 0)
  	elseif button == "mouse_wheel_up" then
  		injectBrowserMouseWheel( GUI.browser, 40, 0)
  	end
  end)

  addEventHandler ( "onClientCursorMove" , root , function ( relativeX , relativeY , absoluteX , absoluteY )
  	injectBrowserMouseMove ( GUI.browser , absoluteX , absoluteY )
  end  )

  return GUI.browser
end

GUI.InitRendering = function()
  local rst = loadBrowserURL(GUI.browser, "http://mta/open_reallife/files/html/index.html")

  if(_CONFIG["browserdebugging"])then
    toggleBrowserDevTools(GUI.browser, true)
  end

  addEventHandler("onClientRender", root, GUI.Render)
end

GUI.Render = function()
  dxSetBlendMode("add")
  dxDrawImage(0, 0, screenX, screenY, GUI.browser, 0, 0,  0, tocolor(255, 255, 255, 255), true)
  dxSetBlendMode("blend")

  dxDrawText(string.format("x %d, y %d, z %d", getElementPosition(localPlayer)), 0, 100)
end
