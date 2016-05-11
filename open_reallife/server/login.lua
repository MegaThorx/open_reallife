Login = {}

Login.Display = function(client)
  triggerClientEvent(client, "onClientDisplayLogin", client)
end
