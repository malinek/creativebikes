require 'rails_helper'

describe Product, type: :model do
  context "When the product has comments" do
    let(:product) { Product.create!(name: "Vintage bike", colour: "white", description: "Our best bike ever", price: "150") }
    let(:user) { User.create!(email: "dan@gmail.com", password: "testtest") }

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "Returns the average rating of all comments" do
      expect(product.average_rating).to eq(3)
    end

  end

  context "Testing validations" do

    it "Is not valid without a name" do
      expect(FactoryBot.build(:product, name: nil)).not_to be_valid
    end

    it "Is not valid without a colour" do
      expect(FactoryBot.build(:product, colour: nil)).not_to be_valid
    end

    it "Is not valid without a description" do
      expect(FactoryBot.build(:product, description: nil)).not_to be_valid
    end

    it "Is not valid without a price" do
      expect(FactoryBot.build(:product, price: nil)).not_to be_valid
    end

  end

end

