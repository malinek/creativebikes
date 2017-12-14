require 'rails_helper'

describe Comment do
  context "Testing validations" do

    it "Comment is not valid without a rating" do
      expect(Comment.new(rating: nil)).not_to be_valid
    end

    it "Comment is not valid without text" do
      expect(Comment.new(body: nil)).not_to be_valid
    end

  end

end