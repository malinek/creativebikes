require 'rails_helper'

describe UsersController, type: :controller do
  let (:user) { User.create!(email: "nina@hotmail.com", password: "secure") }
  let (:user2) { User.create!(email: "eva@gmail.com", password: "test23") }

  describe 'GET #show' do
    context "When a user is logged in" do
    
      before do
        sign_in user
      end

      it "loads correct user details" do
        get :show, id: user.id
        expect(response).to have_http_status(200)
        expect(assigns(:user)).to eq user
      end

    end

    context "When a user is not logged in" do
      it "redirects to login" do
        get :show, id: user.id
        expect(response).to redirect_to(new_user_session_path)
      end

    end

    context "User cannot see other user show page" do
      
      before do
        sign_in user2
      end

      it "redirect to root path" do
        get :show, id: user.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end

  end

end

