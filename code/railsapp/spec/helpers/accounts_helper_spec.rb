require 'spec_helper'

Spec::Matchers.define :match_dom do |expected|
  extend ActionController::TestCase::Assertions
  match do |actual|
    wrapped_assertion do
      assert_dom_equal expected, actual
    end
  end
end

describe AccountsHelper do
  describe "#link_to_account" do
    it "renders a link to the account" do
      account = mock_model(Account, :id => "37", :name => "David")
      assert_dom_equal %Q{<a href="/accounts/37">David's account</a>}, helper.link_to_account(account)
    end
    
    it "does not render a link to another account" do
      account = mock_model(Account, :id => "37", :name => "David")
      helper.link_to_account(account).should_not match_dom(%Q{<a href="/accounts/38">David's account</a>})
    end
  end
end
