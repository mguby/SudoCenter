function clearScreen()
    term.clear()
    term.setCursorPos(1,1)
    term.setCursorBlink(true)
end
 
function intro()
    term.setTextColor(colors.purple)
    print("Appleberry's Computer")
    date = os.day()
    print("Diary Entry " .. date)
    sleep(2)
    print("I don't really want to code today...")
    sleep(2)
    print("but coding is just so fun!")
    sleep(2)
    print("I wonder what they'll have me do tomorrow...")
    sleep(2)
    print("I just want to play games...")
end
 
function printPrivateKey()
    print(">")
    local input = io.read()
    if (input == "private key") then
        print ("BERRY")
        sleep(5)
        return true
    else
        return false
    end
end
 
function main()
    clearScreen()
    intro()
    print("Things on Appleberry's computer...\n")
    sleep(6)
    print("Appleberry's private key")
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