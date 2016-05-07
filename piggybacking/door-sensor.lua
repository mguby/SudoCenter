os.loadAPI("ocs/apis/sensor")

-- the location of the door relative to the sensor
local offset = {
  X = 1,
  Y = 3,
  Z = -2
}

-- how close a player has to be to activate the lamp
local radius = 4

-- find the distance from the player position to the offset
function distance(pos)
  local xd = pos.X - offset.X
  local yd = pos.Y - offset.Y
  local zd = pos.Z - offset.Z
  return math.sqrt(xd*xd + yd*yd + zd*zd)
end

local proximity = sensor.wrap("left")
local before = false
local now = false
while true do
  now = false
  local targets = proximity.getTargets()
  print(textutils.serialise(targets))
  for k, v in pairs(targets) do
    local dist = distance(v.Position) 
    if v["Name"]=="Agent" and dist < radius then
      now = true
      print("Player found! ("..dist..")")
    end
  end
  --target left or entered! open/close door!
    rs.setOutput("back", not now)
    if(not now) then
      print("Agent not found!")
    end
    os.sleep(0.5)
end