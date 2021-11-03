local module = {}
--
function module:FindNumberFromChar(char: string) --Get the alphabet order from A-Z
	if char == "" or char == nil then
		return 0
	else 
		return string.byte(char)-string.byte("a")+1 --Returns the number position of the alphabet 
	end
end
--
function module:FindCharFromNumber(n: number)
  return string.char(string.byte("a")+n-1) --Returns the character from the number position of the alphabet (Alphabets are lowercased)
end
--
function module:FindIntegerInRange(targetNumber: number, targetRange: number) --Get the n times of a digit from the number range.
	local n = 0
	for i= 1, targetRange do 
		for c in tostring(i):gmatch(".") do
			if tonumber(c) == targetNumber then 
				n+=1
			else 
				continue
			end
		end
	end
	return n
end
function module:FindFirstNumberInString(s: string)
	local number = s:match("%d+")
	if number then
		return tonumber(number)
	else
		return
	end
end
--
function module:SplitString(s, remove)
	local result = {}
	for match in (s..remove):gmatch("(.-)"..remove) do
		table.insert(result, match)
	end
	return result
end

return module
