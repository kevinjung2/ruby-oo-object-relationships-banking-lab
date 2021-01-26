class Transfer
  # your code here
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount)
    self.sender = sender
    self.receiver = receiver
    self.status = "pending"
    self.amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid? && self.sender.balance >= @amount ? true : false
  end

  def execute_transaction
    if self.status == "pending" && self.valid? == true
      self.sender.balance -= @amount
      self.receiver.balance += @amount
      self.status = "complete"
    elsif self.status == "pending" && self.valid? == false
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += @amount
      self.receiver.balance -= @amount
      self.status = "reversed"
    end
  end
end
