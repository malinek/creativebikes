require 'rails_helper'

describe Product do
  context "When the product has comments" do
    let(:product) { Product.create!(name: "vintage bike") }
    let(:user) { User.create!(email: "dan@gmail.com", password: "testtest") }

    before do
      product.comments.create!(rating: 1, user: user, body: "Awful bike!")
      product.comments.create!(rating: 3, user: user, body: "Ok bike!")
      product.comments.create!(rating: 5, user: user, body: "Great bike!")
    end

    it "Returns the average rating of all comments" do
      expect(product.average_rating).to eq(3)
    end

    it "Is not valid without a name" do
      expect(Product.new(description: "Nice bike")).not_to be_valid
    end
    
  end

end

