local oldPull = os.pullEvent
os.pullEvent = os.pullEventRaw

term.clear()
term.setCursorPos(1,1)
local primary_colors = {"red", "blue", "yellow"}
local secondary_colors = {"orange", "green", "violet"}
local three_medals = {"gold", "silver", "bronze"}

local rand_num = math.random(1,3)
local password, statement
if(rand_num == 1) then
  password = primary_colors[math.random(1,3)]
  statement = "Which primary color am I thinking of?"
elseif(randNum ==2) then
  password = secondary_colors[math.random(1,3)]
  statement = "Which secondary color am I thinking of?"
else
  password = three_medals[math.random(1,3)]
  statement = "Which Olympic medal color am I thinking of?"
end
local status, input

repeat
  term.setTextColor(colors.blue)
  print(statement)
  term.setTextColor(colors.white)
  status, input = pcall(read)
  if input ~= password then
    term.setTextColor(colors.red)
    print("Incorrect.\n")
  end
until input == password

term.setTextColour(colors.green)
print("ACCESS GRANTED! The password to the next room is forcepush")

term.setTextColour(colors.orange)
print("Hit ESC to continue...")

redstone.setOutput("left", true)
sleep(5)
redstone.setOutput("left", false)
os.pullEvent = oldPull
os.reboot()