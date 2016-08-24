module Bank

  class Account
    attr_accessor :id, :balance

    def initialize(id, balance, empty_account = "We're sorry, but you cannot open an account without some money!")

      @id = id
      @balance = balance
      if @balance <=  0
        raise ArgumentError.new(empty_account)
      end
    end

    def withdraw(withdraw_amount, message = "Your balance cannot go below 0")

      if withdraw_amount > @balance
        raise ArgumentError.new(message) #raise error when balance drops below 0
      else
        @balance = @balance - withdraw_amount
        return @balance
      end


    end #withdraw method end

    def deposit(deposit_amount)

      @balance = @balance + deposit_amount
      return @balance

    end #deposit method end

  end #Account class end

end #module name end
