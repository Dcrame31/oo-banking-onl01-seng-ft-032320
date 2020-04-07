class Transfer
  attr_accessor :amount, :sender, :receiver, :status
  
  def initialize(sender, receiver, amount)
    @amount= amount
    @sender= sender
    @receiver= receiver
    @status= "pending"
  end
  
  def valid?
    sender.valid? && receiver.valid?
  end
  
   def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
    self.receiver.balance-=amount
    self.sender.deposit(amount)
    self.status= "reversed"
  end
  end
end
