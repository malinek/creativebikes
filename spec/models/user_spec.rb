require 'rails_helper'

describe User do
  context "Testing validations" do

    it "User requires email address" do
      expect(User.new(first_name: "Joan", last_name: "South", email: nil)).not_to be_valid
    end

  end

end