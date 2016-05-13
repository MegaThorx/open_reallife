Login = {}

Login.Display = function(client)
  triggerClientEvent(client, "onClientDisplayLogin", client)
end

Login.TryLogin = function(username, password, autologin)
  local handle = SQL.Query("SELECT * FROM accounts WHERE LCASE(username) = LCASE(?)", username)
  local result = SQL.Poll(handle, -1)

  if(#result==0)then
    -- TODO trigger error "NO_SUCH_ACCOUNT"
    triggerClientEvent(client, "onClientDisplayLogin", client, username)
    return
  end

  Utils.Dump("-v", result)

  local result = result[1]
  if(result["password"] == sha256(sha256(password)..result["salt"]))then
    triggerClientEvent(client, "onClientHideLogin", client)
  end
end
addEvent("onTryLogin", true)
addEventHandler("onTryLogin", root, Login.TryLogin)

Login.TryRegister = function(username, email, password, password2)
  local handle = SQL.Query("SELECT * FROM accounts WHERE LCASE(username) = LCASE(?) OR LCASE(email) = LCASE(?)", username, email)
  local result = SQL.Poll(handle, -1)

  if(#result > 0)then
    -- TODO trigger error "ACCOUNT_WITH_THIS_NAME_OR_EMAIL_EXISTS"
    triggerClientEvent(client, "onClientDisplayRegister", client, username, email)
    return
  end

  if not Validator.IsValidEmail(email) then
    -- TODO trigger error "INVALID_EMAIL"
    triggerClientEvent(client, "onClientDisplayRegister", client, username, email)
  end

  if Validator.IsValidAccountName(email) ~= true then
    -- TODO trigger error Validator.IsValidAccountName(email) returns a string with error
    triggerClientEvent(client, "onClientDisplayRegister", client, username, email)
  end

  if password ~= password2 then
    -- TODO trigger error "PASSWORD_ISNT_EQUAL"
    triggerClientEvent(client, "onClientDisplayRegister", client, username, email)
  end

  local salt = Random.GenerateString(8)
  local serial = getPlayerSerial(client)
  local saltedPassword = sha256(sha256(password)..salt)

  local sql = "INSERT INTO accounts (`username`, `password`, `email`, `salt`, `serial`) VALUES (?, ?, ?, ?, ?)"

  SQL.Exec(sql, username, saltedPassword, email, salt, serial)
  Login.TryLogin(username, password)

end
addEvent("onTryRegister", true)
addEventHandler("onTryRegister", root, Login.TryRegister)
