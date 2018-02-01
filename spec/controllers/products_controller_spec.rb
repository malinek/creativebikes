require 'rails_helper'

describe ProductsController, type: :controller do

  describe 'GET #index' do
    it "renders the index template" do
      get :index
      expect(response).to be_ok
      expect(response).to render_template("index")
    end
  end

  describe 'GET #show' do
    before do
      @product = FactoryBot.create(:product)
    end
    it "renders the show template" do
      get :show, id: @product.id
      expect(response).to be_ok
      expect(response).to render_template("show")
    end
  end

  describe 'GET #new' do
    before do
      @user_admin = FactoryBot.create(:admin)
      @user = FactoryBot.create(:user)
    end
    context "When the user is admin" do
      before do
        sign_in @user_admin
      end
      it "renders the new template" do
        get :new
        expect(response).to be_ok
        expect(response).to render_template("new")
      end
    end
    context "When user is not admin and logged in" do
      before do
        sign_in @user
      end
      it "redirects to root path" do
        get :new
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
  end

  describe 'GET #edit' do
    before do
      @product = FactoryBot.create(:product)
      @user_admin = FactoryBot.create(:admin)
      @user = FactoryBot.create(:user)
    end
    context "When the user is admin" do
      before do
        sign_in @user_admin
      end
      it "renders the edit template" do
        get :edit, id: @product.id
        expect(response).to be_ok
        expect(response).to render_template("edit")
      end
    end
    context "When user is not admin and logged in" do
      before do
        sign_in @user
      end
      it "redirects to root path" do
        get :edit, id: @product.id
        expect(response).to have_http_status(302)
        expect(response).to redirect_to(root_path)
      end
    end
    context "When a user is not admin and not logged in" do
      it "redirects to login" do
        get :edit, id: @product.id
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  describe 'POST #create' do
    it "is an valid product" do
      @product = FactoryBot.build(:product)
      expect(@product).to be_valid
    end
    it "is an invalid product, name is missing" do
      @product = FactoryBot.build(:product, name: "")
      expect(@product).not_to be_valid
    end
    it "is an invalid product, price is missing" do
      @product = FactoryBot.build(:product, price: "")
      expect(@product).not_to be_valid
    end
  end

  describe 'PUT #update' do
    before do
      @product = FactoryBot.create(:product)
    end
    it "update product name" do
      @user_admin = FactoryBot.create(:admin)
      sign_in @user_admin
      @update = { name: "Tao", description: @product.description, image_url: @product.image_url, id: @product_id, price: @product.price }
      put :update, id: @product.id, product: @update
      @product.reload
      expect(@product.name).to eq "Tao"
    end
    it "update product name when a user is not admin and not logged in" do
      @update = { name: "Tao", description: @product.description, image_url: @product.image_url, id: @product_id, price: @product.price }
      put :update, id: @product.id, product: @update
      @product.reload
      expect(@product.name).not_to eq "Tao"
    end
    it "update product name when a user is not admin and logged in" do
      @update = { name: "Tao", description: @product.description, image_url: @product.image_url, id: @product_id, price: @product.price }
      put :update, id: @product.id, product: @update
      @product.reload
      expect(@product.name).not_to eq "Tao"
    end
  end

  describe 'DELETE #destroy' do
    it "delete product" do
      @product = FactoryBot.create(:product)
      @user_admin = FactoryBot.create(:admin)
      sign_in @user_admin
      delete :destroy, id: @product.id
      expect(response).to redirect_to products_path
    end
  end

end
