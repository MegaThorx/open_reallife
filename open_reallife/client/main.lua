screenX, screenY = guiGetScreenSize()

addEventHandler("onClientResourceStart", resourceRoot, function()

  setDevelopmentMode(_CONFIG["devmode"], _CONFIG["browserdebugging"])

  setBlurLevel(_CONFIG["blurlevel"])
  setFPSLimit(_CONFIG["fpslimit"])

  GUI.Init()
  HUD.Init()



  addEventHandler("onClientBrowserCreated", GUI.browser,
    function()
      GUI.InitRendering()

    end
  )
  addEventHandler ( "onClientBrowserDocumentReady" , GUI.browser,
  	function ( url )
          triggerServerEvent("onClientReady", localPlayer)
  	end
  )
end)


bindKey("m", "down", function()
  showCursor(not isCursorShowing(), true)
  if(isCursorShowing())then
    focusBrowser(GUI.browser)
  end
end)
