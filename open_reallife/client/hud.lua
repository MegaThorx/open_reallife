HUD = {}

HUD.Init = function()
  setPlayerHudComponentVisible ( "all", false )
  setTimer(HUD.Update, 500, 0)
  setTimer(HUD.UpdateRadar, 100, 0)
end

HUD.Update = function()
  executeBrowserJavascript(GUI.browser, string.format('$("#playername").html("%s")', getPlayerName(getLocalPlayer())))

  executeBrowserJavascript(GUI.browser, string.format('$("#time").html("%s")', Time.GetTime()))
  executeBrowserJavascript(GUI.browser, string.format('$("#money").html("%s")', tostring(getPlayerMoney())))

end

HUD.UpdateRadar = function()
  local x, y = getElementPosition(localPlayer)
  local _, _, z = getElementRotation(localPlayer)
  local fail = executeBrowserJavascript(GUI.browser, string.format('updateRadarPosition(%d, %d, %d);', x, y, z*-1))
end
