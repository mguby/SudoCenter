monitor = peripheral.wrap("back")
monitor.clear()

monitor.setCursorPos(2, 2)
monitor.setTextColour(512)
monitor.setTextScale(2)
monitor.write("Today's Menu")

monitor.setCursorPos(3, 5)
monitor.setTextColour(1)
monitor.setTextScale(1)
monitor.write("Chicken Breast")

monitor.setCursorPos(3, 6)
monitor.setTextColour(1)
monitor.setTextScale(1)
monitor.write("Italian Sausage Slider")

monitor.setCursorPos(3, 7)
monitor.setTextColour(1)
monitor.setTextScale(1)
monitor.write("Spring Vegetable Blend")

monitor.setCursorPos(3, 8)
monitor.setTextColour(1)
monitor.setTextScale(1)
monitor.write("Roasted Cauliflower (Vegan)")

monitor.setCursorPos(3, 9)
monitor.setTextColour(1)
monitor.setTextScale(1)
monitor.write("Steak Fries")

monitor.setCursorPos(3, 10)
monitor.setTextColour(1)
monitor.setTextScale(1)
monitor.write("Cheese Sauce")
