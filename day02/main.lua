local function diffIsSafe(x, y)
  local d = math.abs(x-y)
  return d <= 3 and d >= 1
end

--print(diffIsSafe(2,5))
--print(diffIsSafe(2,6))
--print(diffIsSafe(2,2))

local function sgn(x)
  if x > 0 then
    return 1
  else
    return -1
  end
end


local function isSafe(arr)
  local s = sgn(arr[2]-arr[1])
  for i = 2, #arr do
    if not diffIsSafe(arr[i], arr[i-1]) then
      return false
    end

    if s ~= sgn(arr[i] - arr[i-1]) then
      return false
    end

  end

  return true
end

--print(isSafe({1,2,3}))
--print(isSafe({1,2,2}))
--print(isSafe({3,2,2}))
--print(isSafe({3,2,1}))

local cnt = 0
for line in io.lines("./data.txt") do
  local arr = {}
  for s in string.gmatch(line, "%S+") do
    arr[#arr+1] = tonumber(s)
  end
  local safe = isSafe(arr)
  if safe then
    print(line)
    cnt = cnt + 1
  end

end

print ("total safe: " .. cnt)
