HUD = {}
HUD.armorVisible = true

HUD.Init = function()
  setPlayerHudComponentVisible ( "all", false )
  setTimer(HUD.Update, 500, 0)
  setTimer(HUD.UpdateRadar, 100, 0)
end

HUD.Update = function()
  if not GUI.isReady then return end
  executeBrowserJavascript(GUI.browser, string.format('$("#playername").html("%s")', getPlayerName(getLocalPlayer())))

  executeBrowserJavascript(GUI.browser, string.format('$("#time").html("%s")', Time.GetTime()))
  executeBrowserJavascript(GUI.browser, string.format('$("#money").html("%s")', tostring(getPlayerMoney()).." ".."$"))
  executeBrowserJavascript(GUI.browser, string.format('$("#zone").html("%s")', getZoneName(getElementPosition(getLocalPlayer()))))

  local health = getElementHealth(getLocalPlayer())
  executeBrowserJavascript ( GUI.browser, "setLife('"..math.floor(health).."');" )
  local Armor = getPedArmor(getLocalPlayer())
  executeBrowserJavascript ( GUI.browser, "setArmor('"..math.floor(Armor).."');" )  
  if Armor == 0 and HUD.armorVisible == true then
	executeBrowserJavascript(GUI.browser, '$("#armor").css("visibility", "hidden");')
	HUD.armor = false
  elseif Armor > 0 and HUD.armorVisible == false then
	executeBrowserJavascript(GUI.browser, '$("#armor").css("visibility", "visible");')
	HUD.armor = true
  end

end

HUD.UpdateRadar = function()
  if not GUI.isReady then return end
  local x, y = getElementPosition(localPlayer)
  local _, _, z = getElementRotation(localPlayer)
  executeBrowserJavascript(GUI.browser, string.format('updateRadarPosition(%d, %d, %d);', x, y, z*-1))
end

HUD.Hide = function()
  executeBrowserJavascript(GUI.browser, '$(".hud").css("visibility", "hidden");')
  executeBrowserJavascript(GUI.browser, '$(".radar").css("visibility", "hidden");')
  showChat(false)
end

HUD.Show = function()
  executeBrowserJavascript(GUI.browser, '$(".hud").css("visibility", "visible");')
  executeBrowserJavascript(GUI.browser, '$(".radar").css("visibility", "visible");')
  showChat(true)
end
