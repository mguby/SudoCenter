while true do
 term.clear()
 term.setCursorPos(1, 1)
 print("Please Enter Password:")
 input = read("*") -- Read input from user
 if input == "password" then -- change password here to whatever password you want
  redstone.setOutput("left", true) -- Change "left" to whatever direction the door is in or change line to "rednet" for wireless computers
  print("Access granted!")
  sleep(5)
  redstone.setOutput("left", false) -- Change "left" to whatever direction the door is in or change line to "rednet" for wireless computers
 else
  print("Incorrect password, try again.")
  sleep(2)
 end
end