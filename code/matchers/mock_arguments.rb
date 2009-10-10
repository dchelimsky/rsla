require 'spec_helper'

Spec::Matchers.define :at_least do |amount, currency|
  match do |actual|
    actual >= Money.new(amount, currency)
  end
  
  description do
    "at least #{amount} #{currency}"
  end
end

describe Account do
  it "gets a bonus" do
    account = Account.new
    account.should_receive(:deposit).with(at_least(100, :BLR))
    account.deposit(Money.new(101, :BLR))
  end
end