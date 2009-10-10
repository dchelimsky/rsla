require 'spec_helper'

Spec::Matchers.define :have_a_balance_of do |money|
  match do |account|
    account.balance == money
  end
  
  failure_message_for_should do
    "expected Account to have #{money.inspect}"
  end
  
  failure_message_for_should_not do
    "expected Account not to have #{money.inspect}"
  end
end

describe Account do
  context "when first created" do
    it { should have_a_balance_of(Money.new(0, :BLR))}
    it { should_not have_a_balance_of(Money.new(1_000_000, :BLR))}
  end
end
