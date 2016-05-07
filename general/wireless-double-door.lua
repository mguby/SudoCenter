redstone.setOutput("back", true)
rednet.open("top")
while true do
  print("Listening...")
  local senderID, message, protocol = rednet.receive()
  print("Got Message: "..message)
  if message == "OPEN" then
    redstone.setOutput("back", false)
  end
  if message == "CLOSE" then
    redstone.setOutput("back", true)
  end
end