-- buffer overflow in tutorial building

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
    print("   tutorial --  buffer overflow tutorial")
    print("   hack     --  hack buffer overflow")
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
  print("You have 3 buffers: A, B and C")
  sleep(3)

  term.setTextColor(colors.orange)
  print("\n==============================")
  term.setTextColor(colors.red)
  print("char[8] A = \"I live in \"")
  term.setTextColor(colors.lime)
  print("char[6] B = \"Sparta\"")
  term.setTextColor(colors.cyan)
  print("chat[10] C = \", Kentucky\"")
  term.setTextColor(colors.orange)
  print("==============================\n")
  sleep(12)

  term.setTextColor(colors.lightBlue)
  print("To hack the password of the door, you need to\n")

  term.setTextColor(colors.orange)
  print("replace B with the value \"Urbana\"")
  print("replace C with the value \", Illinois\".")
  print("\nso that after concating A, B, C we can get")
  term.setTextColor(colors.lime)
  print("\"I live in Urbana, Illinois\"\n")
  sleep(16)

  term.setTextColor(colors.lightBlue)
  print("However, you can only change the value of B!")
  print("So think about how will you change C by only changing B?")
  term.setTextColor(colors.brown)
  print("@@ hint, B has size 6, C also has size 10!")
  sleep(10)

  local answer
  local a = "I live in "
  local b = "Sparta"
  local c = ", Kentucky"
  while true do
    term.setTextColor(colors.orange)
    print("\n===============================================")

    term.setTextColor(colors.red)
    print("A = \"" .. a .. "\", B=\"" .. b .. "\", C = \"" .. c .. "\"")
    term.setTextColor(colors.lightBlue)
    print("produces :\"" .. a .. b .. c .. "\"")
    print("not equal:\"I live in Urbana, Illinois\"\n")

    term.setTextColor(colors.yellow)
    print("enter new value for B > ")

    answer = read()

    if string.len(answer) < 6 then
      b = answer .. string.sub(b, string.len(answer) + 1, -1)
    elseif string.len(answer) == 6 then
      b = answer
    else
      b = string.sub(answer, 1, 6)
      rest = string.sub(answer, 7, -1)

      if string.len(rest) == 10 then
        if rest == ", Illinois" and b == "Urbana" then

          term.setTextColor(colors.orange)
          print("\n\nA = \"" .. a .. "\", B = \"" .. b .. "\", C=\"" ..  rest .. "\"")

          term.setTextColor(colors.lightBlue)
          print("\"" .. a .. b .. rest .. "\"\n")
          print("\nYou made it! The password is 'opendoor'")
          sleep(5)
          clearScreen()
          break
        else
          c = rest
        end
      elseif string.len(rest) < 10 then
        c = rest .. string.sub(c, string.len(rest) + 1, -1)
      else
        c = string.sub(rest, 1, 10)
      end
    end
  end
end

prompt()