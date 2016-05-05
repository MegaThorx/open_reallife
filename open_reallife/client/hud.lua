HUD = {}

HUD.Init = function()
  setPlayerHudComponentVisible ( "all", false )
  setPlayerHudComponentVisible ( "radar", true )
  setTimer(HUD.Update, 1000, 0)
end

HUD.Update = function()
  executeBrowserJavascript(GUI.browser, string.format('$("#playername").html("%s")', getPlayerName(getLocalPlayer())))

  executeBrowserJavascript(GUI.browser, string.format('$("#time").html("%s")', Time.GetTime()))
  executeBrowserJavascript(GUI.browser, string.format('$("#money").html("%s")', tostring(getPlayerMoney())))
end
