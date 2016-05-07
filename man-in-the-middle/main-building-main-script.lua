function clearScreen()
    term.clear()
    term.setCursorPos(1,1)
    term.setCursorBlink(true)
end

function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, match);
    end
    return result;
end

function incorrectNumOfParams(actual, required)
    print("You have " .. actual .. " arguments, but you need " .. required)
    sleep(3)
end

function checkParams(inpParams, correctParams)
    if #inpParams ~= #correctParams then 
        incorrectNumOfParams(#inpParams, #correctParams)
        return false
    end

    for i = 0, #inpParams do
        if inpParams[i] ~= correctParams[i] then
            print("Hmm...argument " .. i .. " doesn't seem right. Try again!")
            sleep(5)
            return false
        end
    end
    return true
end

function printExitInfo()
    term.setTextColor(colors.red)
    print("If you don't have one of the keys, type 'exit' to go back to the home screen.")
    term.setTextColor(colors.green)
end

function decodeMessage()
    term.setTextColor(colors.yellow)
    print("You are monitoring your local network and see that Puce and Appleberry are sending messages to each other.\n")
    sleep(3)
    term.setTextColor(colors.green)
    print("Appleberry is sending a message to Puce... ")
    sleep(3)
    printMessageUsage = false

    repeat
        term.setTextColor(colors.yellow)
        print("Quick! Intercept the message using the message command.")
        sleep(4)
        term.setTextColor(colors.green)
        print("Oh no! It's encrypted! To decrypt it, we need to have Puce's private key.\n")
        sleep(2)
        term.setTextColor(colors.green)
        print("Type 'message' below to decrypt it.\n")
        print(">")
        input = read()
		input = input:match( "^%s*(.-)%s*$" )
        if input == "message" then
            printMessageUsage = true
            term.setTextColor(colors.green)
            clearScreen()
            print("Usage:")
            sleep(3)
            term.setTextColor(colors.pink)
            print("message <Receiver's name> <Receiver's private key>\n")
			print("")
            sleep(3)
        end
    until (printMessageUsage == true)

    term.setTextColor(colors.green)
    print("Nice! Now, let's use the message command to decrypt what Appleberry was trying to send Puce.")
    sleep(3)
    printExitInfo()
    print(">")
    input = read()
    input = input:match( "^%s*(.-)%s*$" )
    if input == "exit" then
        os.reboot()
    end

    inpParams = split(input, " ")
    correctParams = {"message", "Puce", "BERRY"}
    correctUsage = checkParams(inpParams, correctParams)

    repeat
        if (correctUsage) then
            term.setTextColor(colors.purple)
            print("Awesome!\n")
        else
            term.setTextColor(colors.green)
            clearScreen()
            print("Let's use the message command to see what Appleberry is trying to sent Puce.")
            sleep(2)
            term.setTextColor(colors.pink)
            print("message <Receiver's name> <Sender's private key> <public key>")
            sleep(2)
            printExitInfo()
            term.setTextColor(colors.green)
            print(">")
            input = read()
    		input = input:match( "^%s*(.-)%s*$" )
            if input == "exit" then
                break
            else
                inpParams = split(input, " ")
                correctUsage = checkParams(inpParams, correctParams)
            end
        end
    until (correctUsage == true)

    term.setTextColor(colors.yellow)
    print("The decoded message Appleberry is trying to send to Puce is...")
    sleep(3)
    term.setTextColor(colors.green)
    print("Hey, did you see those people breaking in earlier?!")
    sleep(3)
    term.setTextColor(colors.yellow)
    print("Let's change it! Let's ask Puce for the password instead.")
    sleep(3)
    term.setTextColor(colors.magenta)
    print("Let's send this...")
    sleep(3)
    print("Hey, Puce! Do you remember what the password to Agent Gold's office is?")
    sleep(3)
    term.setTextColor(colors.green)
    print("Sending message to Puce from Appleberry...")
    sleep(2)
    term.setTextColor(colors.yellow)
    print("Sent!")
    sleep(3)
    term.setTextColor(colors.green)
    print("Puce is typing...")
    sleep(3)
    term.setTextColor(colors.yellow)
    print("Puce is sending a message to Appleberry")
    sleep(3)
    term.setTextColor(colors.green)
    print("We're almost there! We just need to intercept this one last message.")
    sleep(3)
    term.setTextColor(colors.yellow)
    print("Oh no! It's encrypted again!")
    sleep(8)
    term.setTextColor(colors.green)
    print("We're going to need Appleberry's private key to decrypt it.")
    clearScreen()
    print("Use the message command again to get the password to see what Puce is sending to Appleberry!")
    sleep(3)
    term.setTextColor(colors.pink)
    print("message <Receiver's name> <Receiver's private key>")
    sleep(3)
    print(">")


    printExitInfo()
    print(">")
    input = read()
    input = input:match( "^%s*(.-)%s*$" )

    if input == "exit" then
        os.reboot()
    end

    inpParams = split(input, " ")
    correctParams = {"message", "Appleberry", "CHERRY"}
    correctUsage = checkParams(inpParams, correctParams)

    repeat
        if (correctUsage) then
            term.setTextColor(colors.purple)
            print("Awesome!")
        else
            term.setTextColor(colors.green)
            print("Let's use the message command to see what Appleberry is trying to sent Puce.\n")
            sleep(2)
            clearScreen()
            term.setTextColor(colors.pink)
            print("message <Receiver's name> <Receiver's private key>")
            sleep(1)
            printExitInfo()
            term.setTextColor(colors.green)
            print(">")
            input = read()
			input = input:match( "^%s*(.-)%s*$" )
            if input == "exit" then
                os.reboot()
            else
                inpParams = split(input, " ")
                correctUsage = checkParams(inpParams, correctParams)
            end
        end
    until (correctUsage == true)

    print("The decoded message Puce is trying to send to Appleberry is...")
    sleep(3)
    term.setTextColor(colors.yellow)
    print("Hey, what's with all these people running around?")
    sleep(3)
    print("Oh yeah. The password is \"BEST AGENT\". Without the quotes. I can't believe he's so cocky!")
    sleep(3)
end



decodeMessage()