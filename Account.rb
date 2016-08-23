module Bank

  class Account
    attr_accessor :id, :balance

    def initialize(id) #should I put a balance argument here?
      @id = id
      @balance = 1000 #inital balance of 1000
    end

    def withdraw(withdraw_amount)

     @balance = @balance - withdraw_amount
      return @balance
#if balance withdraw goes below 0, raise error
    end #withdraw method end

    def deposit(deposit_amount)

      @balance = @balance + deposit_amount
      return @balance

    end #deposit method end

  end #Account class end

end #module name end
