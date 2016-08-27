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
=begin
foots = Bank::CheckingAccount.new(1234, 400)
foots.withdraw(300)
 => 99 
foots.check_count
 => 0
foots.withdraw_using_check(5)
 => 94
foots.check_count
 => 1
foots.withdraw_using_check(5)
 => 89
foots.withdraw_using_check(5)
 => 84
foots.withdraw_using_check(5)
 => 79
foots.withdraw_using_check(5)
 => 72
foots.withdraw_using_check(70)
 => 0
foots.withdraw_using_check(5)
 => -7
foots.withdraw_using_check(5)
# ArgumentError: Don't go below $-10
	from /Users/dlaguerta/ada/project-forks/BankAccounts/CheckingAccount.rb:26:in `withdraw_using_check'
	from (irb):12
	from /Users/dlaguerta/.rvm/rubies/ruby-2.3.1/bin/irb:11:in `<main>'
foots.balance
 => -7
foots.deposit(500)
 => 493
foots.reset_checks
 => 0
foots.withdraw(80)
 => 412
=end
