require 'spec_helper'

describe "/accounts/edit.html.erb" do
  include AccountsHelper

  before(:each) do
    assigns[:account] = @account = stub_model(Account,
      :new_record? => false,
      :name => "value for name"
    )
  end

  it "renders the edit account form" do
    render

    response.should have_tag("form[action=#{account_path(@account)}][method=post]") do
      with_tag('input#account_name[name=?]', "account[name]")
    end
  end
end
