require_relative "Account"
module Bank
  # create a class called SavingsAccount
  class SavingsAccount < Account
    MINIMUM_BALANCE = 10
    attr_accessor :balance #add :id here?

    def initialize(id, balance)# minimum_account= "Your savings account must start with at least $10!")
      super
      # @id = id
      # @balance = balance
      #super() should allow us in inherit the instance variables of the Account class
      #     - It cannot go below a balance of $10
      # if @balance < MINIMUM_BALANCE
      # raise ArgumentError.new(minimum_account)
      # end
      #       if it does, raise an ArgumentError
    end  #end initialize

    #old savings withdrawal method
    def withdraw(withdraw_amount, minimum_account= "Your savings account cannot go below $10!")
      withdraw_amount = withdraw_amount + 2
      if (@balance - withdraw_amount) < MINIMUM_BALANCE
        puts minimum_account
        return @balance
      end
      super
    end

    #add method for adding the interest rate
    def add_interest(rate)
      interest_amount = @balance * rate/100
      return @balance = @balance + interest_amount
    end
  end
end


#Stuff run in terminal
foot_saves = Bank::SavingsAccount.new("FootsMoney", 600)
 #=> #<Bank::SavingsAccount:0x007f851c8e7120 @id="FootsMoney", @balance=600>
foot_saves.withdraw(100)
 #=> 498
foot_saves.add_interest(20)
#  => 597
foot_saves.balance
#  => 597
foot_saves.withdraw(590)
#Your savings account cannot go below $10!
#  => 597
foots.add_interest(20)
