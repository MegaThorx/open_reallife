Server = {}
Server.this = getThisResource()

Server.Restart = function(resource)
  restartResource(Server.this)
end

Server.Shutdown = function(reason)
  shutdown(reason)
end
