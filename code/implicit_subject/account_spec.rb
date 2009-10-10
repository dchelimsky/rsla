require 'spec_helper'

describe Account do
  context "when first created" do
    it "has a balance of zero reais" do
      subject.balance.should == Money.new(0, :BLR)
    end
  end

  context "when first created" do
    it { should have_a_balance_of(0, :BLR)}
  end
end
