require 'spec_helper'

module WrappedAssertions
  attr_reader :assertion_error
  
  def self.extension_modules
    @extension_modules ||= [Test::Unit::Assertions]
  end
  
  def self.add_assertions(mod)
    extension_modules << mod
  end
  
  def wrap_assertion
    WrappedAssertions.extension_modules.map {|mod| extend mod}
    begin
      yield
      true
    rescue Exception => e
      @assertion_error = e
      false
    end
  end
end

WrappedAssertions.add_assertions ActionController::TestCase::Assertions

Spec::Matchers.define :match_dom do |expected|
  extend WrappedAssertions
  match do |actual|
    wrap_assertion do
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
    
    it "renders a link to the account" do
      account = mock_model(Account, :id => "38", :name => "David")
      helper.link_to_account(account).should match_dom(%Q{<a href="/accounts/37">David's account</a>})
    end
    
    it "does not render a link to another account" do
      account = mock_model(Account, :id => "37", :name => "David")
      helper.link_to_account(account).should_not match_dom(%Q{<a href="/accounts/38">David's account</a>})
    end
  end
end
