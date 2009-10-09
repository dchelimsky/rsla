require 'account'

class InsufficientFunds < StandardError; end

class Account
  def withdraw(amount, currency)
    raise InsufficientFunds.new if amount > 10
  end
end

describe Account do
  context "with 10 BLR" do
    it "denies a withdrawal of 11 BLR" do
      account = Account.new(10, :BRL)
      expect { account.withdraw(11, :BLR) }.
        to raise_error(InsufficientFunds)
    end

    it "allows a withdrawal of 10 BLR" do
      account = Account.new(10, :BRL)
      expect { account.withdraw(10, :BLR) }.
        to_not raise_error(InsufficientFunds)
    end
  end
end

# describe Account do
#   context "with 10 BLR" do
#     before(:each) { @account = Account.new(10, :BRL) }
#     it "denies a withdrawal of 11 BLR" do
#       expect { @account.withdraw(11, :BLR) }.
#         to raise_error(InsufficientFunds)
#     end
# 
#     it "allows a withdrawal of 10 BLR" do
#       expect { @account.withdraw(10, :BLR) }.
#         to_not raise_error(InsufficientFunds)
#     end
#   end
# end
# 
# describe Account do
#   context "with 10 BLR" do
#     let(:account) { Account.new(10, :BRL) }
#     it "denies a withdrawal of 11 BLR" do
#       expect { account.withdraw(11, :BLR) }.
#         to raise_error(InsufficientFunds)
#     end
# 
#     it "allows a withdrawal of 10 BLR" do
#       expect { account.withdraw(10, :BLR) }.
#         to_not raise_error(InsufficientFunds)
#     end
#   end
# end
# 
