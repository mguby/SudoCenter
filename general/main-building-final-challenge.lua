function table.contains(table, element) 
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

function removeElement(element) 
	for i = 1, table.getn(passwords) do
		if passwords[i] == element then
			table.remove(passwords, i)
			return 
		end
	end
end

local oldPull = os.pullEvent
os.pullEvent = os.pullEventRaw

term.clear()
term.setCursorPos(1,1)
passwords = {"YiyiW", "MarkG", "DuncanB", "RadwanF"}
local status, input

repeat
  term.setTextColor(colors.blue)
  print("Please enter the password (" .. table.getn(passwords) .. " remaining)")
  term.setTextColor(colors.white)
  status, input = pcall(read)
  if table.contains(passwords, input) == false then
    term.setTextColor(colors.red)
    print("Incorrect. Rebooting\n")
    sleep(3)
    os.pullEvent = oldPull
	os.reboot()
  else
  	print("Correct! One password is correct.")
  	removeElement(input)
  end
until table.getn(passwords) == 0

term.setTextColour(colors.green)
print("ACCESS GRANTED!")

term.setTextColour(colors.orange)
print("Hit ESC to continue...")

redstone.setOutput("left", true)
sleep(5)
redstone.setOutput("left", false)
os.pullEvent = oldPull
os.reboot()