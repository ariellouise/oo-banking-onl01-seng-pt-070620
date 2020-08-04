class Transfer
  attr_accessor :sender, :receiver, :status, :amount 
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending" #part of attr accs. needs to be initialized 
  end 
  
  def valid? 
    self.sender.valid? && self.receiver.valid?
  end 
  
  def execute_transaction
    if valid? && @status == "pending" && sender.balance > amount
      @sender.balance -= @amount 
      @receiver.balance += @amount 
      @status = "complete"
    else 
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end
  
end
