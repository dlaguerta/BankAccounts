require_relative "Account"
module Bank
  class CheckingAccount < Account
    attr_accessor :check_count

    #think about addding a constant for minimum balance of -10
    #create CheckingAccount class with inherit Account class
    #create withdrawal method


    def initialize(id, balance) #fix here to use super and inherit id from Account class
      @id = id
      @balance = balance
      @check_count = 0
    end

#I don't even need this here anymore?
    def withdraw(withdraw_amount, message = "Your balance cannot go below 0")
      super
      # @balance = @balance - 1 - withdraw_amount
      # if @balance < 0
      #   puts message
      #   return @balance = @balance + 1 + withdraw_amount
      # else
      #   return @balance
      # end
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
