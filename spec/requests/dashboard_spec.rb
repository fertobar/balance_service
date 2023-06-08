require 'rails_helper'

RSpec.describe DashboardController, type: :controller do
  describe "GET #index" do
    context "when user is not logged in" do
      it "redirects to login page" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context "when user is logged in" do
      before do
        @user = FactoryBot.create(:user)
        sign_in @user
      end

      it "returns http success" do
        get :index
        expect(response).to have_http_status(:success)
      end
    end
  end
end
