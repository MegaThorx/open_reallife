addEventHandler("onResourceStart", resourceRoot, function()
  local start = getTickCount()
  -- Basic Setup
  --Console.Clear()
  Log.PrintServer("Starting %s", _CONFIG["servername"])

  if not isObjectInACLGroup("resource."..getResourceName(getThisResource()), aclGetGroup("Admin")) then
    Console.Print("Admin permission is required")
    cancelEvent(true)
    return
  end


  setGameType(_CONFIG["gamemode"])
  setServerPassword(_CONFIG["password"])


  -- Setup SQL
  if(SQL.Connect())then
    Console.Print("Successfully connected to the database")
  else
    Console.Print("Failed to connected to the database")
  end

  SQL_MANAGER.Validate()


  local diff = getTickCount() - start
  Log.PrintServer("Started %s in %ims", _CONFIG["servername"], diff)
end)

addCommandHandler("rst", function()
  Server.Restart()
end)
