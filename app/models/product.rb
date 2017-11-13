class Product < ActiveRecord::Base
  has_many :orders
end

def Product.search(search_term)
  like_string = Rails.env.production? ? "ilike" : "LIKE"
  Product.where("name #{like_string} ?", "%#{search_term}%")
end