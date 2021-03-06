class BankAccount
    attr_accessor :balance, :status
    attr_reader :name

    def initialize(user_name)
        @name = user_name
        @balance = 1000
        @status = 'open'
    end

    def deposit(amount)
        self.balance += amount
    end
    
    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        if status == 'open' && balance > 0
            return true
        else
            false
        end
    end

    def close_account
        self.status = 'closed'
    end
end
