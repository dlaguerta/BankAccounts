#SavingsAccount.rb
#module Bank
# create a class called SavingsAccount
class SavingsAccount #< Account
#   Inherit the behavior of the Account class (add the < Account )
#   Attributes of the SavingsAccount:
attr_accessor :balance

  def initialize(id, balance, minimum_account= "Your savings account must start with at least $10!")
    @id = id
    @balance = balance
  #super() should allow us in inherit the instance variables of the Account class
#     - It cannot go below a balance of $10
    if @balance < 10
    raise ArgumentError.new(minimum_account)
    end
#       if it does, raise an ArgumentError
  end  #end initialize

#   Create a method for withdrawal that:
  def savings_withdrawal(withdraw_amount, minimum_account= "Your savings account cannot go below $10!")
#     - subtracts $2 from the balance each time you withdrawal
    if (@balance - 2 - withdraw_amount) < 10
      raise ArgumentError.new(minimum_account)
    else
      @balance = @balance - 2 - withdraw_amount
      return @balance
    end
  end
end
#     - Cannot go below $10, raises an argument error. This includes subtracting the original $2 when calling the method
#       -return the original balance
#end
