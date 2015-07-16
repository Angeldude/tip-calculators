module Calculator

  def main
    def calc_gui(user, user2 = "")
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
    end

    calc_gui("How much is the bill?")

    def tip_calc(bill, percent)
      total = bill + (percent * bill)
      total
    end

    def options
      tip = 0
      breaker = true
      while breaker do
        calc_gui("Your tip options are:","1: 15%, 2: 20%, 3: 25%")
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
          calc_gui("Only options 1, 2,", "or 3 are allowed.")
          sleep(3)
        end
      end
      tip
    end

    def string_check
      ending = false
      until ending do
        user = gets.chomp
        if user.to_f.respond_to?(:/) and not user.to_f <= 0.0
          ending = true
          user = user.delete(',\'').to_f
        else
          calc_gui("Invalid input, ", "try again.")
        end
      end
      user
    end

    def in_group(total)
      calc_gui("How many people?")
      num_people = string_check
      if num_people < 1
        my_share = 1
      elsif num_people == 1
        my_share = total
      else
        my_share = total / num_people
      end
      my_share
    end

    amount = string_check
    total = tip_calc(amount, options)
    final = in_group(total).round(2)
    calc_gui("Your shared amount is:", final)
  end
end
