require 'CSV'
module Bank
  class Account
    attr_accessor :id, :balance, :account_open_date

    def initialize(accounts_hash, empty_account = "We're sorry, but you cannot open an account without some money!")
      @id = accounts_hash[:id]
      @balance = accounts_hash[:balance]
      @account_open_date = accounts_hash[:account_open_date]

      if @balance <=  0
        raise ArgumentError.new(empty_account)
      end

    end #end initialize method

    def self.all
      accounts = []
      CSV.read("./support/accounts.csv").each do |line|
        accounts_hash = {}
        accounts_hash[:id] = line[0]
        accounts_hash[:balance] = line[1].to_f/100
        accounts_hash[:account_open_date] = line[2]
      accounts << Bank::Account.new(accounts_hash)
    end
      return accounts
    end



#DON'T TOUCH THIS YET
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
end


foots = Bank::Account.all
puts foots

foots.each do |a|
  puts a.balance
end
