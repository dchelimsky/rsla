Spec::Matchers.define :have_a_balance_of do |amount, currency|
  match do |account|
    account.balance == Money.new(amount, currency)
  end
end

