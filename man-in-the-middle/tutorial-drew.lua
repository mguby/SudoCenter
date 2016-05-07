function clearScreen()
    term.clear()
    term.setCursorPos(1,1)
    term.setCursorBlink(true)
end
 
function intro()
    term.setTextColor(colors.purple)
    print("Drew's Computer")
    date = os.day()
    print("Diary Entry " .. date)
    sleep(6)
    print("That pizza I had for lunch today was really good...")
    sleep(6)
    print("That crust was just so FLUFFY")
    sleep(6)
    print("I wonder what they'll have tomorrow...")
    sleep(6)
    print("I'm going to dream about that fluffy crust...\n")
    sleep(6)
end
 
function printPrivateKey()
    correctInp = false
    repeat 
        print(">")
        local input = io.read()
        if (input == "private key") then
            correctInp = True
            print ("FLUFFY")
            sleep(5)
            return true
        else
            print("Try again\n")
        end
    until (correctInp == true)
end
 
function main()
    clearScreen()
    intro()
    print("Things on Drew's computer...\n")
    sleep(6)
    print("Drew's private key")
    sleep(6)
    print("To print the private key, type 'private key'")
    printed = printPrivateKey()
    while not printed do
        print("Hint: Try typing 'private key' ")
        printed = printPrivateKey()
    end
    sleep(3)
    os.reboot()
end
 
main()