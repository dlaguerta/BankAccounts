require_relative "Account"
module Bank
  class CheckingAccount < Account
    MINIMUM_BALANCE = 0
    attr_accessor :check_count

    def initialize(id, balance)
      super
      # @id = id
      # @balance = balance
      @check_count = 0
    end

#withdraw method that subtracts 1 for withdraw fee
    def withdraw(withdraw_amount, message = "Your balance cannot go below 0")
      withdraw_amount = withdraw_amount + 1
      super
    end

    def withdraw_using_check(amount, message = "Don't go below $-10")
      #make check_count an instance variable?
      if @balance - amount < -10
        raise ArgumentError.new(message)
      else
        if @check_count > 3
          @check_count += 1
          @balance = @balance - 2 - amount
          return @balance
        else
          @check_count += 1
          @balance = @balance - amount
          return @balance
        end
      end
    end

    #reset_checks -- resets the checks to zero
    def reset_checks
      @check_count = 0
    end

  end #CheckingAccount
end #bank


#Code I run in Terminal to test

puts foots = Bank::CheckingAccount.new(1234, 400)
puts foots.withdraw(300)
 #=> 99
puts foots.check_count
# => 0
puts foots.withdraw_using_check(5)
# => 94
puts foots.check_count
# => 1
puts foots.withdraw_using_check(5)
# => 89
puts foots.withdraw_using_check(5)
# => 84
puts foots.withdraw_using_check(5)
# => 79
puts foots.withdraw_using_check(5)
# => 72
puts foots.withdraw_using_check(70)
# => 0
puts foots.withdraw_using_check(5)
# => -7
puts foots.reset_checks
# => 0
puts foots.withdraw_using_check(5)
# ArgumentError: Don't go below $-10
puts foots.balance
# => -7
puts foots.deposit(500)
# => 493

puts foots.withdraw(80)
# => 412
