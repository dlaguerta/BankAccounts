require 'CSV'
#require_relative 'Owner.rb'
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

    #returns a collection of Account instances, representing all of the Accounts described in the CSV. See below for the CSV file specifications
    def self.all
      accounts = []
      CSV.read("./support/accounts.csv").each do |line|
        accounts_hash = {}
        accounts_hash[:id] = line[0].to_i
        accounts_hash[:balance] = line[1].to_f/100
        accounts_hash[:account_open_date] = line[2]
        accounts << Bank::Account.new(accounts_hash)
      end
      return accounts
    end

    #returns an instance of Account where the value of the id field in the CSV matches the passed parameter
    def self.find(id)
      self.all.each do |account|
        if account.id == id
          return account
        end
      end
    end


    #DON'T TOUCH THIS YET
    #method to withdraw money from an account
    def withdraw(withdraw_amount, message = "Your balance cannot go below 0")

      if withdraw_amount > @balance
        puts message
        return @balance
      else
        @balance = @balance - withdraw_amount
        return @balance
      end
    end #withdraw method end

    #method to deposit money into an account
    def deposit(deposit_amount)
      @balance = @balance + deposit_amount
      return @balance
    end #deposit method end

  end #Account class end
end
