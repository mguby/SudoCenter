function clearScreen()
    term.clear()
    term.setCursorPos(1,1)
    term.setCursorBlink(true)
end
 
function intro()
    term.setTextColor(colors.lightBlue)
    print("Michael's Computer")
    sleep(6)
    print("Diary Entry 239")
    sleep(6)
    print("I think I'm going to get a cat...")
    sleep(6)
    print("Or should I get a dog...")
    sleep(6)
    print("Or better yet, I should get a UNICORN.")
    sleep(6)
    print("I WILL NAME IT FLUFFY.")
    sleep(6)
    print("AND IT WILL BE MY FLUFFY.\n")
    sleep(6)
end
 
function printPrivateKey()
    correctInp = false
    repeat 
        print(">")
        local input = io.read()
        if (input == "private key") then
            correctInp = True
            print ("UNICORN")
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
    print("Things on Michael's computer...\n")
    sleep(6)
    print("Michael's private key")
    sleep(6)
    print("To print the private key, type 'private key'")
    printed = printPrivateKey()
    sleep(3)
    os.reboot()
end
 
main()