-- this is invalid since the site requires login
inlink = "https://adventofcode.com/2024/day/1/input"
curlcmd = "curl -s -k " .. inlink
print(curlcmd)

local data = io.popen(curlcmd)

if data then
  sdata = data:read("*a")
  print(sdata)
else
  print("curl failed")
end
