require 'spec_helper'

describe "/accounts/new.html.erb" do
  include AccountsHelper

  before(:each) do
    assigns[:account] = stub_model(Account,
      :new_record? => true,
      :name => "value for name"
    )
  end

  it "renders new account form" do
    render

    response.should have_tag("form[action=?][method=post]", accounts_path) do
      with_tag("input#account_name[name=?]", "account[name]")
    end
  end
end
