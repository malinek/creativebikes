require 'rails_helper'

describe Comment, type: :model do
  context "Testing validations" do

    it "Comment is not valid without text" do
      expect(Comment.new(body: nil)).not_to be_valid
    end

    it "Comment is not valid without a user" do
      expect(Comment.new(user: nil)).not_to be_valid
    end

    it "Comment is not valid without a product" do
      expect(Comment.new(product: nil)).not_to be_valid
    end

    it "Comment is not valid without a rating" do
      expect(Comment.new(rating: nil)).not_to be_valid
    end

  end

end