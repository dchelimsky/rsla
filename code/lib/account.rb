require 'money'

class Account
  attr_reader :balance

  def initialize(amount=nil, currency=nil)
    if amount && currency
      deposit(amount, currency)
    else
      @balance = Money.new(0, :BLR)
    end
  end
  
  def deposit(amount, currency)
    @balance = Money.new(amount, currency)
  end

  def inspect
    "Account (#{balance.inspect})"
  end
end
