class Transfer
  # your code here
  attr_accessor :amount, :sender, :receiver, :status

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def rejected
    self.status = 'rejected'
    "Transaction rejected. Please check your account balance."
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == 'pending'
      sender.balance -= amount
      receiver.balance += amount
      self.status = 'complete'
    else
      return rejected
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == 'complete'
      sender.balance += amount
      receiver.balance -= amount
      self.status = 'reversed'
    else
      return rejected
    end
  end
end
