class Money
  attr_reader :amount, :currency
  def initialize(amount, currency)
    @amount, @currency = amount, currency
  end
  
  def ==(other)
    @currency == other.currency && @amount == other.amount
  end
  
  def >=(other)
    amount >= other.amount
  end
  
  def inspect
    "#{@amount} #{@currency}"
  end
end
