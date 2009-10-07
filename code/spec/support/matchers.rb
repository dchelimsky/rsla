Spec::Matchers.define :have_a_balance_of do |money|
  match do |account|
    account.balance == money
  end
end

