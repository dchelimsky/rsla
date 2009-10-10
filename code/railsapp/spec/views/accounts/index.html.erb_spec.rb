require 'spec_helper'

describe "/accounts/index.html.erb" do
  include AccountsHelper

  before(:each) do
    assigns[:accounts] = [
      stub_model(Account,
        :name => "value for name"
      ),
      stub_model(Account,
        :name => "value for name"
      )
    ]
  end

  it "renders a list of accounts" do
    render
    response.should have_tag("tr>td", "value for name".to_s, 2)
  end
end
