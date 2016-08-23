module Bank

  class Account
    attr_accessor :id, :balance

    def initialize(id) #should I put a balance argument here?
      @id = id
      @balance = 1000 #inital balance of 1000
    end

    def withdraw(withdraw_amount, message = "Your balance cannot go below 0")
      if withdraw_amount > @balance
        raise ArgumentError.new(message)#if balance withdraw goes below 0, raise error
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
