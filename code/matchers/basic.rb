require 'spec_helper'

Spec::Matchers.define :have_a_balance_of do |money|
  match do |account|
    account.balance == money
  end
end

describe Account do
  context "when first created" do
    it { should have_a_balance_of(Money.new(0, :BLR))}
  end
end

describe Account do
  context "when first created" do
    it { should_not have_a_balance_of(Money.new(1_000_0000, :BLR))}
  end
end
