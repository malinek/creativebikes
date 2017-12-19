require 'rails_helper'

describe UsersController, type: :controller do
  let (:user) { User.create!(email: "nina@hotmail.com", password: "secure") }

  describe 'GET #show' do
    context "When a user is logged in" do
    
      before do
        sign_in user
      end

      it "loads correct user details" do
        get :show, params: { id: user.id }
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq user
      end

    end

    context "When a user is not logged in" do
      it "redirects to login" do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(new_user_session_path)
      end

    end

  end

end



