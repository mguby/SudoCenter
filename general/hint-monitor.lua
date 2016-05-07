monitor = peripheral.wrap("back")
monitor.clear()

monitor.setCursorPos(2, 2)
monitor.setTextColour(colors.orange)
monitor.setTextScale(2)
monitor.write("Lookaround for the four passwords")
monitor.setCursorPos(2, 3)
monitor.write("to get into the center room!")