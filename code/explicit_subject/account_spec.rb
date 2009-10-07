require 'spec_helper'

describe Account do
  context "with 100 reais" do
    subject { Account.new(100, :BLR) }
    it "has a balance of 100 reais" do
      subject.balance.should == Money.new(100, :BLR)
    end

    it { should have_a_balance_of(Money.new(100, :BLR))}
  end
end
