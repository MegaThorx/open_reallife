Login = {}


Login.Display = function(...)
  Login.ShowWindow(...)
end
addEvent("onClientDisplayLogin", true)
addEventHandler("onClientDisplayLogin", root, Login.Display)

Login.DisplayRegister = function(...)
  Login.ShowWindowRegister(...)
end
addEvent("onClientDisplayRegister", true)
addEventHandler("onClientDisplayRegister", root, Login.DisplayRegister)

Login.Hide = function()
  Login.HideWindow()
end

Login.ShowWindow = function(username)
  executeBrowserJavascript(GUI.browser, '$("#login").css("visibility", "visible");')
  executeBrowserJavascript(GUI.browser, '$("#login").contents().get(0).location.href = "http://mta/open_reallife/files/html/login.html"')

  if(username)then
    setTimer(function()
      executeBrowserJavascript(GUI.browser, '$("#login").contents().find("#username").val("'..username..'")')
    end, 100, 1)
  end

  Cursor.Show()
  HUD.Hide()
end

Login.ShowWindowRegister = function(username, email)
  executeBrowserJavascript(GUI.browser, '$("#login").css("visibility", "visible");')
  executeBrowserJavascript(GUI.browser, '$("#login").contents().get(0).location.href = "http://mta/open_reallife/files/html/register.html"')

  if(username)then
    setTimer(function()
      executeBrowserJavascript(GUI.browser, '$("#login").contents().find("#username").val("'..username..'")')
    end, 100, 1)
  end

  if(email)then
    setTimer(function()
      executeBrowserJavascript(GUI.browser, '$("#login").contents().find("#email").val("'..email..'")')
    end, 100, 1)
  end

  Cursor.Show()
  HUD.Hide()
end

Login.HideWindow = function()
  executeBrowserJavascript(GUI.browser, '$("#login").css("visibility", "hidden");')
  Cursor.Hide()
  HUD.Show()
end
addEvent("onClientHideLogin", true)
addEventHandler("onClientHideLogin", root, Login.HideWindow)

Login.OnSubmit = function(_, post)
  local username = HTML.Decode(post["username"])
  local password = HTML.Decode(post["password"])
  local autologin = HTML.Decode(post["remember_me"])

  if(username == "" or password == "")then
    -- TODO add errors
  else
    Login.HideWindow()
    triggerServerEvent("onTryLogin", localPlayer, username, password, autologin)
  end
end
GUI.AddAjaxGetHandler("login", Login.OnSubmit)

Login.OnRegister = function(_, post)
  local username = HTML.Decode(post["username"])
  local email = HTML.Decode(post["email"])
  local password = HTML.Decode(post["password"])
  local password2 = HTML.Decode(post["password_confirmation"])
  local toc = HTML.Decode(post["t_and_c"])

  if(username == "" or email == "" or password == "" or password2 == ""  or not toc)then
    -- TODO add errors
    Login.ShowWindowRegister(username, email)
  else
    Login.HideWindow()
    triggerServerEvent("onTryRegister", localPlayer, username, email, password, password2)
  end
end
GUI.AddAjaxGetHandler("register", Login.OnRegister)
