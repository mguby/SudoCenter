while true do
  term.clear()
  term.setCursorPos(1,1)
    local stLo = string.byte('a')
    local enLo = string.byte('z')
    local stHi = string.byte('A')
    local enHi = string.byte('Z')
    local result = ""
    print("Please enter your encrypyted word")
    local inputString = read()
    for cur=1, string.len(inputString) do
 
      local chabyte = string.byte(string.sub(inputString,cur,cur))
   
      if chabyte >= stLo and chabyte <=enLo then
        chabyte = math.fmod(chabyte - stLo - 1, 26) + stLo
      elseif chabyte >= stHi and chabyte <= enHi then
        chabyte = math.fmod(chabyte - stHi - 1,26) + stHi
      end
      result = result..string.char(chabyte)
    end
  print("ROT1 Complete")
  print(result)
  sleep(4)
end