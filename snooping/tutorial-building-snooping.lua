-- This script combines the basic password functionality with a 
-- looping conversation that plays when the student enters a password correctly.
-- The conversation should tell the student the next password that he/she needs.
-- gubatan2

while true do -- First make sure student has password from first part
 while true do
  term.clear()
  term.setCursorPos(1, 1)
  print("Please Enter Password:")
  input = read("*")
  if input == "password" then -- Change word here to change what the password is
   print("Access granted!")
   break;
  else
   print("Incorrect password, try again.")
   sleep(2)
  end
 end

 x = 0
 while x < 2 do -- Allow student to see dialog twice just in case they miss it the first time
  sleep(1)
  term.clear()
  term.setCursorPos(1, 1) -- Change dialog below to suit your needs, delay of 3 is sufficient
  print("[Computer 1]: Now that we're talking in private, let's go over the password.")
  sleep(3)
  print("[Computer 2]: Ah yes, the password to the door to the next room is snoopdogg")
  sleep(3)
  print("[Computer 1]: Oh right, do you think that's a good password?")
  sleep(3)
  print("[Computer 2]: Yes I believe so.")
  sleep(5)
  x = x + 1
 end
 print("Locked out! Enter password again.")
 sleep(2)
end