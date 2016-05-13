Validator = {}

Validator.IsValidEmail = function(str)
  if str == nil then return nil end
  if (type(str) ~= 'string') then
    return false
  end

  local lastAt = str:find("[^%@]+$")
  local localPart = str:sub(1, (lastAt - 2)) -- Returns the substring before '@' symbol
  local domainPart = str:sub(lastAt, #str) -- Returns the substring after '@' symbol
  -- we werent able to split the email properly
  if localPart == nil then
    return false, "Local name is invalid"
  end

  if domainPart == nil then
    return false, "Domain is invalid"
  end
  -- local part is maxed at 64 characters
  if #localPart > 64 then
    return false, "Local name must be less than 64 characters"
  end
  -- domains are maxed at 253 characters
  if #domainPart > 253 then
    return false, "Domain must be less than 253 characters"
  end
  -- somthing is wrong
  if lastAt >= 65 then
    return false, "Invalid @ symbol usage"
  end
  -- quotes are only allowed at the beginning of a the local name
  local quotes = localPart:find("[\"]")
  if type(quotes) == 'number' and quotes > 1 then
    return false, "Invalid usage of quotes"
  end
  -- no @ symbols allowed outside quotes
  if localPart:find("%@+") and quotes == nil then
    return false, "Invalid @ symbol usage in local part"
  end
  -- only 1 period in succession allowed
  if domainPart:find("%.%.") then
    return false, "Too many periods in domain"
  end
  -- just a general match
  if not str:match('[%w]*[%p]*%@+[%w]*[%.]?[%w]*') then
    return false, "Email pattern test failed"
  end
  -- all our tests passed, so we are ok
  return true
end

Validator.IsValidAccountName = function(str)
	local allowed = true

  if #str < 3 or #str > 30 then
		allowed = "ACCOUNTNAME_TOO_SHORT_OR_TOO_LONG"
	elseif(string.find(str,"#%x%x%x%x%x%x")~=nil)then
		allowed = "ACCOUNTNAME_NO_COLOR_CODES_ALLOWED"
	end

	return allowed
end
