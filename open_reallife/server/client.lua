Client = {}

Client.Ready = function()
  -- TODO change this :/
  if(client ~= source)then
    Log.PrintCheat("Event triggered for other player by (serial '%s', player '%s')", getPlayerSerial(client), getPlayerName(client))
    return
  end

  Login.Display(client)
end
addEvent("onClientReady", true)
addEventHandler("onClientReady", root, Client.Ready)
