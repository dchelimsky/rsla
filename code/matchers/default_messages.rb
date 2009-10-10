require 'spec_helper'

Spec::Matchers.define :have_a_balance_of do |money|
  match do |account|
    account.balance == money
  end
end

describe Account do
  context "when first created" do
    it "has a zero balance" do
      account = Account.new
      account.should have_a_balance_of(Money.new(0, :BLR))
    end

    it "does not have a non- balance" do
      account = Account.new
      account.should_not have_a_balance_of(Money.new(10, :BLR))
    end
  end
end
