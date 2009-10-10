require 'spec_helper'

describe Account do
  context "with a zero balance" do
    it "accepts deposits" do
      subject.deposit(12, :USD)
      subject.should have_a_balance_of(12, :USD)
    end
  end
end
