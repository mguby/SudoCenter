function clearScreen()
    term.clear()
    term.setCursorPos(1,1)
    term.setCursorBlink(true)
end
 
function intro()
    term.setTextColor(colors.lightBlue)
    print("Puce's Computer")
    sleep(2)
    print("Diary Entry " .. 600*math.random())
    sleep(2)
    print("Someday I think I'll go to Japan...")
    sleep(2)
    print("I hear it's very nice there...")
    sleep(2)
    print("Or maybe I'll go to Korea!")
    sleep(2)
    print("Just a few more days to go and I'll be on vacation!")
    sleep(2)
    print("I can't wait!")
    sleep(2)
end
 
function printPrivateKey()
    print(">")
    local input = io.read()
    if (input == "private key") then
        print ("CHERRY")
        sleep(5)
        return true
    else
        return false
    end
end
 
function main()
    clearScreen()
    intro()
    print("Things on Puce's computer...\n")
    sleep(6)
    print("Puce's private key")
    sleep(6)
    printed = printPrivateKey()
    while not printed do
        print("Hint: Try typing 'private key' ")
        printed = printPrivateKey()
    end
    sleep(3)
    os.reboot()
end
 
main()