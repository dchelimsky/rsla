class AccountsController
end

describe AccountsController do
  describe "POST create" do
    context "with valid attributes" do
      it "creates an account" do
        Account.should_receive(:create!).
          with({'these' => 'params'})
        post :create, :params => {'these' => 'params'}
      end
      it "redirects to the index" do
        Account.stub(:create)
        post :create, :params => {}
        response.should redirect_to(:index)
      end
    end
  end
end
