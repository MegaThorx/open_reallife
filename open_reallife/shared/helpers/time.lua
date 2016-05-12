Time = {}

Time.GetTimestamp = function(year, month, day, hour, minute, second)
    local monthseconds = { 2678400, 2419200, 2678400, 2592000, 2678400, 2592000, 2678400, 2678400, 2592000, 2678400, 2592000, 2678400 }
    local timestamp = 0
    local datetime = getRealTime()
    year, month, day = year or datetime.year + 1900, month or datetime.month + 1, day or datetime.monthday
    hour, minute, second = hour or datetime.hour, minute or datetime.minute, second or datetime.second

    -- calculate timestamp
    for i=1970, year-1 do timestamp = timestamp + (Time.IsLeapYear(i) and 31622400 or 31536000) end
    for i=1, month-1 do timestamp = timestamp + ((Time.IsLeapYear(year) and i == 2) and 2505600 or monthseconds[i]) end
    timestamp = timestamp + 86400 * (day - 1) + 3600 * hour + 60 * minute + second

    timestamp = timestamp - 3600 --GMT+1 compensation
    if datetime.isdst then timestamp = timestamp - 3600 end

    return timestamp
end

Time.IsLeapYear = function(year)
    if year then year = math.floor(year)
    else year = getRealTime().year + 1900 end
    return ((year % 4 == 0 and year % 100 ~= 0) or year % 400 == 0)
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
