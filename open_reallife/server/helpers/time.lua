Time = {}

Time.GetTimestamp = function()
  return getRealTime().timestamp
end

Time.GetDateShort = function()
	local time = getRealTime()
	local day = time.monthday
	local month = time.month+1
	local year = time.year+1900

  if day < 10 then day = "0"..day end
  if month < 10 then month = "0"..month end

  return day.."."..month.."."..year
end

Time.GetTime = function()
	local time = getRealTime()
  local hour = time.hour
  local minute = time.minute
  local seconds = time.second

  if hour < 10 then hour = "0"..hour end
  if minute < 10 then minute = "0"..minute end
  if seconds < 10 then seconds = "0"..seconds end

  return hour..":"..minute..":"..seconds
end
