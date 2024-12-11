filepath = "data.txt"

local lines = {}
print("iterating over lines in " .. filepath)
for line in io.lines(filepath) do
  lines[#lines+1] = line
  print(#lines .. " lines")
end

-- sanity check
--for k, v in pairs(lines) do
--  print(k, v)
--end



