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
    if sender.balance < @amount || !self.valid? 
       self.status= "rejected"
       "Transaction rejected. Please check your account balance."
     else
    sender.balance-=amount
    receiver.deposit(amount)
    self.status= "complete"
     end
  end

  def reverse_transfer
    if self.status = "completed"
    self.receiver.balance-=amount
    self.sender.deposit(amount)
  end
  end
end
