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
    print("You have " .. actual .. " arguments, but you need " .. required .. "\n")
    sleep(8)
end

function checkParams(inpParams, correctParams)
    if #inpParams ~= #correctParams then 
        incorrectNumOfParams(#inpParams, #correctParams)
        return false
    end

    for i = 0, #inpParams do
        if inpParams[i] ~= correctParams[i] then
            print("Hmm... " .. inpParams[i] .. " doesn't seem right. Try again!\n")
            sleep(8)
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
    print("You are monitoring your local network and see that Michael and Drew are sending messages to each other.\n")
    sleep(8)
    term.setTextColor(colors.green)
    print("Drew is sending a message to Michael... ")
    sleep(8)
    printMessageUsage = false

    repeat
        term.setTextColor(colors.yellow)
        print("Quick! Let's try to intercept the message.")
        sleep(8)
        term.setTextColor(colors.green)
        print("Oh no! It's encrypted! To decrypt it, we need to have Michael's private key.\n")
        sleep(8)
        term.setTextColor(colors.yellow)
        print("Type 'message' below to decrypt it.\n")
        print(">")
        term.setTextColor(colors.yellow)
        input = read()
        input = input:match( "^%s*(.-)%s*$" )
        if input == "message" then
            printMessageUsage = true
            term.setTextColor(colors.green)
            clearScreen()
            print("Usage:")
            sleep(8)
            term.setTextColor(colors.pink)
            print("message <Receiver's name> <Receiver's private key>\n")
            print("")
            sleep(8)
        end
    until (printMessageUsage == true)

    term.setTextColor(colors.green)
    print("Nice! Now, let's use the message command to decrypt what Drew was trying to send Michael.")
    sleep(8)
    printExitInfo()
    print(">")
    input = read()
    input = input:match( "^%s*(.-)%s*$" )
    if input == "exit" then
        os.reboot()
    end

    inpParams = split(input, " ")
    correctParams = {"message", "Michael", "UNICORN"}
    correctUsage = checkParams(inpParams, correctParams)

    repeat
        if (correctUsage) then
            term.setTextColor(colors.purple)
            print("Awesome!\n")
        else
            term.setTextColor(colors.green)
            clearScreen()
            print("Let's use the message command to see what Drew is trying to sent Michael.")
            sleep(8)
            term.setTextColor(colors.pink)
            print("message <Receiver's name> <Receiver's private key>")
            sleep(8)
            printExitInfo()
            term.setTextColor(colors.green)
            print(">")
            term.setTextColor(colors.yellow)
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
    print("The decrypted message Drew is trying to send to Michael is...")
    sleep(8)
    term.setTextColor(colors.green)
    print("Hey, did you try that pizza in the cafeteria today?!")
    sleep(8)
    term.setTextColor(colors.yellow)
    print("Let's change it! Let's ask Michael for the password instead.")
    sleep(8)
    term.setTextColor(colors.magenta)
    print("Let's send this...")
    sleep(8)
    print("Hey, Michael! Do you remember what the password for the door is?")
    sleep(8)
    term.setTextColor(colors.green)
    print("Sending message from Drew to Michael...")
    sleep(8)
    term.setTextColor(colors.yellow)
    print("Sent!")
    sleep(8)
    term.setTextColor(colors.green)
    print("Michael is typing...")
    sleep(8)
    term.setTextColor(colors.yellow)
    print("Michael is sending a message to Drew")
    sleep(8)
    term.setTextColor(colors.green)
    print("We're almost there! We just need to intercept this one last message.")
    sleep(8)
    term.setTextColor(colors.yellow)
    print("Oh no! It's encrypted again!")
    sleep(8)
    term.setTextColor(colors.green)
    print("We're going to need Drew's private key to decrypt it.")
    sleep(8)
    term.setTextColor(colors.yellow)
    clearScreen()
    print("Use the message command again to see what Michael is sending to Drew!")
    term.setTextColor(colors.pink)
    print("message <Receiver's name> <Receiver's private key>")
    sleep(8)

    printExitInfo()
    print(">")
    input = read()
    input = input:match( "^%s*(.-)%s*$" )
    if input == "exit" then
        os.reboot()
    end

    inpParams = split(input, " ")
    correctParams = {"message", "Drew", "FLUFFY"}
    correctUsage = checkParams(inpParams, correctParams)

    repeat
        if (correctUsage) then
            term.setTextColor(colors.purple)
            print("Awesome!")
        else
            clearScreen()
            term.setTextColor(colors.green)
            print("Let's use the message command to see what Drew is trying to sent Michael.\n")
            sleep(8)
            term.setTextColor(colors.pink)
            print("message <Receiver's name> <Receiver's private key>")
            sleep(8)
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

    print("The decoded message Michael is trying to send to Drew is...")
    sleep(8)
    term.setTextColor(colors.yellow)
    print("Hey, do you think I should get a pet unicorn?")
    sleep(8)
    print("Oh yeah. The password is FLUFFY THE UNICORN.")
    sleep(12)
    os.reboot()
end

decodeMessage()