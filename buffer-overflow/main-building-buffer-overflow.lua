-- buffer overflow in main building

-- clear terminal screen
function clearScreen()
  term.clear()
  term.setCursorPos(1,1)
  term.setCursorBlink(true)
end

-- show 2 commands: 'tutorial' and 'hack'
function prompt()
  local answer
  while true do
    clearScreen()
    term.setTextColor(colors.yellow)
    print("Commands:")
    term.setTextColor(colors.cyan)
    print("   hack     --  hack buffer overflow")
    print("   tutorial --  buffer overflow tutorial, if you need to look at the tutorial again")
    term.setTextColor(colors.yellow)
    print("\n> ")
    answer = read()

    if answer == "tutorial" then
      tutorial()
    elseif answer == "hack" then
      hack()
    elseif answer == "exit" then
      os.reboot()
    else
      print("Invalid command. Please enter 'tutorial' or 'hack'")
      sleep(3)
    end
  end
end

-- buffer overflow tutorial
function tutorial()
  clearScreen()
  term.setTextColor(colors.lightBlue)
  print("What is buffer overflow?")
  print("Assume you have a buffer A.")
  print("A has size 8.")
  sleep(3)

  term.setTextColor(colors.orange)
  print("\n==============================")
  term.setTextColor(colors.red)
  print("char[8] A = \"security\"")
  term.setTextColor(colors.orange)
  print("==============================\n")
  sleep(5)

  term.setTextColor(colors.lightBlue)
  print("Now you have an empty buffer B defined after A.")
  print("Try to enter any value for B.")

  term.setTextColor(colors.green)
  print("\nenter a value for B >")
  local b = read()
  while (string.len(b) == 0) do -- prevent empty string
    print("\nenter a value for B >")
    b = read()
  end
  local b_buffer_size = string.len(b) -- get buffer size for B

  clearScreen()
  term.setTextColor(colors.orange)
  print("Great! you just defined a value for buffer B.")
  print("So now we have:")
  sleep(4)

  term.setTextColor(colors.orange)
  print("\n==============================")
  term.setTextColor(colors.red)
  print("char[8] A = \"security\"")
  term.setTextColor(colors.lime)
  print("char[" .. b_buffer_size .. "] B = \"" .. b .. "\"")
  term.setTextColor(colors.orange)
  print("==============================\n")


  sleep(4)
  term.setTextColor(colors.lightBlue)
  print("Now try to modify A and see what would happen?")

  local answer
  local a = "security"
  local count = 0 -- if count reaches 3, hint students to enter words longer than 8 characters
  while true do
    term.setTextColor(colors.orange)
    print("\n===============================================")
    term.setTextColor(colors.red)
    print("A = \"" .. a .. "\", B = \"" .. b .. "\" \n")

    if count > 3 then
      term.setTextColor(colors.lightBlue)
      print("try to enter longer word like \"123456789\" ;)")
      term.setTextColor(colors.yellow)
      print("enter new value for A > ")
    else
      term.setTextColor(colors.yellow)
      print("enter new value for A > ")
    end

    answer = read()

    if string.len(answer) == 8 then
      a = answer
    elseif string.len(answer) < 8 then
      a = answer .. string.sub(a, string.len(answer)+1, -1)
    else -- buffer overflow
      a = string.sub(answer, 1, 8)
      b = string.sub(answer, 9, -1) .. string.sub(b, string.len(answer) - 8 + 1, -1)
      term.setTextColor(colors.orange)

      print("\n===============================================")
      term.setTextColor(colors.red)
      print("A = \"" .. a .. "\", B = \"" .. b .. "\" \n")

      print("\n\n\n\nCongrats! Buffer Overflow happened!\n")
      sleep(3)

      term.setTextColor(colors.orange)
      print("You just entered a value: ")
      term.setTextColor(colors.red)
      print("     \"" .. answer .. "\"")
      term.setTextColor(colors.orange)
      print("whose length is greater than buffer A size 8!! ")

      sleep(5)
      print("\nso it overrides buffer B, and produces: ")
      print("==============================")
      term.setTextColor(colors.red)
      print("char[8] A = \"security\"")
      term.setTextColor(colors.lime)
      print("char[" .. b_buffer_size .. "] B = \"" .. b .. "\"")
      term.setTextColor(colors.orange)
      print("==============================\n")

      sleep(5)
      print("this is called buffer overflow,")
      print("which will sometimes cause unpredictable program behavior.")
      sleep(8)
      print("\n\nnow try to run 'hack' command to hack the door password! ")

      term.setTextColor(colors.lightBlue)
      print("\npress any key to continue... ")
      answer = read()
      break
    end

    count = count + 1
  end
end

-- buffer overflow hack
function hack()
  clearScreen()
  term.setTextColor(colors.lightBlue)
  print("You have 2 variables: A and B")
  sleep(2)

  term.setTextColor(colors.orange)
  print("\n==============================")
  term.setTextColor(colors.red)
  print("char[8] A = 'theater'")
  term.setTextColor(colors.lime)
  print("char[8] B = 'noentry'")
  term.setTextColor(colors.orange)
  print("==============================\n")
  sleep(5)

  term.setTextColor(colors.lightBlue)
  print("To hack the password of the door, you need to replace B with the value 'letmein'. ")
  print("However, you can only change the value of A!")
  print("So, how will you change B by only changing 'A'?")
  term.setTextColor(colors.brown)
  print("@@ hint, A has size 7, B also has size 7!")
  sleep(5)

  local answer
  local a = "theater"
  local b = "noentry"
  while true do
    term.setTextColor(colors.orange)
    print("\n===============================================")

    term.setTextColor(colors.red)
    print("A" ..  " = '" .. a .. "', B='" ..  b .. "' \n")

    term.setTextColor(colors.yellow)
    print("enter new value for A > ")

    answer = read()

    if string.len(answer) < 7 then
      a = answer .. string.sub(a, string.len(answer) + 1, -1)
    elseif string.len(answer) == 7 then
      a = answer
    else
      a = string.sub(answer, 1, 7)
      rest = string.sub(answer, 8, -1)

      if string.len(rest) == 7 then
        if rest == "letmein" then

          term.setTextColor(colors.orange)
          print("\n\nA" ..  " = '" .. a .. "', B='" ..  rest .. "' \n")
          print("You made it! The theater is open!")
          rednet.send(55, "OPEN")
          sleep(5)
          rednet.send(55, "CLOSE")

          clearScreen()
          break
        else
          b = rest
        end
      elseif string.len(rest) < 8 then
        b = rest .. string.sub(b, string.len(rest) + 1, -1)
      else
        b = string.sub(rest, 1, 8)
      end
    end
  end
end

prompt()