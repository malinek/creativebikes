class Product < ApplicationRecord
  has_many :orders
  has_many :comments

  validates :name, :description, :colour, :price, presence: true

  def highest_rating_comment
    comments.rating_desc.first
  end

  def lowest_rating_comment
    comments.rating_asc.first
  end

  def average_rating
    comments.average(:rating).to_f
  end

  def Product.search(search_term)
    like_string = Rails.env.production? ? "ilike" : "LIKE"
    Product.where("name #{like_string} ?", "%#{search_term}%")
  end

  def views
    # this is equivalent to "GET product:1"
    $redis.get("product:#{id}")
  end

  def viewed!
    # this is equivalent to "INC product:1"
    $redis.incr("product:#{id}")
  end


end

