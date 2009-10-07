class Money
  def initialize(*args)
  end
  
  def ==(other)
    true
  end
end

class Account
  def balance
    Money.new(0, :brl)
  end
end

describe Account do
  describe "when first created" do
    it "has a balance of zero reais" do
      pending "money needs to support more than :usd" do
        account = Account.new
        account.balance.should == Money.new(0, :brl)
      end
    end
  end
end
