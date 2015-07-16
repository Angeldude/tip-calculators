require './tip'

gui = CalcGui.new
check_me = StringChecker.new

gui.image("How much is the bill?")
amount = check_me.string_check(gui)

gui.image("Your tip options are:", "1: 15%, 2: 20%, 3: 25%")
tip = check_me.options(gui)

gui.image("How many people?")
people = check_me.string_check(gui)

final_amount = Calc.new(amount, tip, people)
gui.image("You pay:", "#{final_amount.calculate}")
