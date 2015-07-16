#the calculator class to compute the final total
class Calc
  def initialize(amount, tip, people)
    @amount = amount
    @tip = tip
    @people = people
  end

  def calculate
    total = @amount + (@amount * @tip)
    if @people < 0
      final = 0
    elsif @people < 1
      final = total
    else
      final = total / @people
    end
  end
end

# simple text gui for the tip calculator
class CalcGui
  def image(user, user2 = "")
    25.times do
      puts
    end
    puts <<-END
    ______________________
    #{user}
    #{user2}
    |_____________________|
    |    __   __   __     |
    |   |__| |__| |__|    |
    |    __   __   __     |
    |   |__| |__| |__|    |
    |    __   __   __     |
    |   |__| |__| |__|    |
    |_____________________|
    END
    10.times do
      puts
    end
    sleep(3)
  end
end

# checks string to make sure a number was inputted
# haven't found a way to decouple from gui class
class StringChecker
  def string_check(gui_object) # figure out a better way
    ending = false
    until ending do
      user = gets.chomp
      if user.to_f.respond_to?(:/) and not user.to_f <= 0.0
        ending = true
        user = user.delete(',\'').to_f
      else
        gui_object.image("Invalid input, ", "try again.") # this one too
      end
    end
    user
  end

  def options(gui_object) #figure out a better way for this
    tip = 0
    breaker = true
    while breaker do
      case gets.chomp
      when "1"
        tip = 0.15
        breaker = false
      when "2"
        tip = 0.20
        breaker = false
      when "3"
        tip = 0.25
        breaker = false
      else
        gui_object.image("Only options 1, 2,", "or 3 are allowed.") #and this one
      end
    end
    tip
  end
end
