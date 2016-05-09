local monitor = peripheral.wrap("back")

function display1()
  monitor.clear()
  monitor.setCursorPos(2, 2)
  monitor.setTextScale(4)
  monitor.write("Welcome")
  monitor.setCursorPos(2, 4)
  monitor.write("Kids")
end

function display2()
  monitor.clear()
  monitor.setCursorPos(2, 2)
  monitor.setTextScale(4)
  monitor.write("Ready to")
  monitor.setCursorPos(2, 4)
  monitor.write("Hack ?")
end

local count = 2
while true do
  if count % 2 == 0 then
    display1()
  else
    display2()
  end
  sleep(5)
  count = count + 1
end
