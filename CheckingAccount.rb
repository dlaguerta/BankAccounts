module Bank
  class CheckingAccount < Account
    #think about addding a constant for minimum balance of -10
#create CheckingAccount class with inherit Account class
#create withdrawal method
  #method subtracts $1 for each withdrawal, plus the withdrawal amount
    #if balance goes negative, raise argument error and return original unmodified balance
    #returns updated balance
  #end withdraw method

  #xcreate a withdraw_using_check(amount) method
  #def withdraw_using_check(amount)
    #check_count = 0 <--make as an instance variable?
    #allow account to overdraft up to $-10 but not any lower
    #allow user to withdrawwith penalty the first 3 times
      #if > 3, subtract $2 as a transaction fee
      # if check_count > 3
      # @balance = balance - amount - 2
      #return @balance

    #check_count += 1
  #end of withdraw_using_check method

  #reset_checks -- resets the checks to zero
  #def reset_checks
    #check_count = 0
  #end
  end CheckingAccount
end #bank
