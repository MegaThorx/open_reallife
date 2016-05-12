Login = {}

Login.Display = function(client)
  triggerClientEvent(client, "onClientDisplayLogin", client)
end

Login.TryLogin = function(username, password, autologin)
  local handle = SQL.Query("SELECT * FROM accounts WHERE LCASE(username) = LCASE(?)", username)
  local result = SQL.Poll(handle, 5)

  if(#result==0)then
    -- TODO trigger error "NO_SUCH_ACCOUNT"
    triggerClientEvent(client, "onClientDisplayLogin", client)
    return
  end
end
addEvent("onTryLogin", true)
addEventHandler("onTryLogin", root, Login.TryLogin)
