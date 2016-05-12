Login = {}

Login.Display = function()
  Login.ShowWindow()
end
addEvent("onClientDisplayLogin", true)
addEventHandler("onClientDisplayLogin", root, Login.Display)

Login.DisplayRegister = function()
  Login.ShowWindowRegister()
end
addEvent("onClientDisplayRegister", true)
addEventHandler("onClientDisplayRegister", root, Login.DisplayRegister)

Login.Hide = function()
  Login.HideWindow()
end

Login.ShowWindow = function()
  executeBrowserJavascript(GUI.browser, '$("#login").css("visibility", "visible");')
  executeBrowserJavascript(GUI.browser, '$("#login").contents().get(0).location.href = "http://mta/open_reallife/files/html/login.html"')
  Cursor.Show()
  HUD.Hide()
end

Login.ShowWindowRegister = function()
  executeBrowserJavascript(GUI.browser, '$("#login").css("visibility", "visible");')
  executeBrowserJavascript(GUI.browser, '$("#login").contents().get(0).location.href = "http://mta/open_reallife/files/html/login.html"')
  Cursor.Show()
  HUD.Hide()
end

Login.HideWindow = function()
  executeBrowserJavascript(GUI.browser, '$("#login").css("visibility", "hidden");')
  Cursor.Hide()
  HUD.Show()
end

Login.OnSubmit = function(_, post)
  local username = post["username"]
  local password = post["password"]
  local autologin = post["remember_me"]

  if(username == "" or password == "")then
    -- TODO add errors
  else
    Login.HideWindow()
    triggerServerEvent("onTryLogin", localPlayer, username, password, autologin)
  end
end
GUI.AddAjaxGetHandler("login", Login.OnSubmit)

Login.OnRegister = function(_, post)
  local username = post["username"]
  local email = post["email"]
  local password = post["password"]
  local password2 = post["password_confirmation"]
  local toc = post["t_and_c"]

  for k,v in pairs(post) do
    outputDebugString(k.." "..v)
  end

  if(username == "" or email == "" or password == "" or password2 == ""  or not toc)then
    -- TODO add errors
  else
    Login.HideWindow()
    triggerServerEvent("onTryRegister", localPlayer, username, email, password, password2)
  end
end
GUI.AddAjaxGetHandler("register", Login.OnRegister)
