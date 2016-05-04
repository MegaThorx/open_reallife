Console = {}

Console.Clear = function(amount)
  if not amount then amount = 20 end

  for var = 0, amount, 1 do
    outputServerLog(" ")
  end
end

Console.Print = function(text, ...)
  outputServerLog(string.format(text, ...))
end
