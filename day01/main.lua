filepath = "data.txt"

local lines = {}
print("iterating over lines in " .. filepath)
for line in io.lines(filepath) do
  lines[#lines+1] = line
  --print(#lines .. " lines")
end

-- sanity check
--for k, v in pairs(lines) do
--  print(k, v)
--end

local vectors = {}
vectors[1] = {}
vectors[2] = {}
i = 0
print("starting loop to split to two vecs")
for line in io.lines(filepath) do
  for s in string.gmatch(line,"%S+") do
    print("inserting " .. s .. " to vector " .. i+1)
    table.insert(vectors[i+1], tonumber(s))
    i = (1+i) % 2
  end
end

table.sort(vectors[1])
table.sort(vectors[2])

local acc = 0
for i = 1, #vectors[1] do
  acc = acc + math.abs(vectors[2][i]-vectors[1][i])
end
print(acc)
