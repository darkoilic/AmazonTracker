class Product < ActiveRecord::Base
  has_many :prices
  attr_accessible :ASIN, :name

  validates :name, presence: true
  validates :ASIN, presence: true, :length => { :is => 10 }

  def current_price
    price = self.prices.last
    unless price; price = Price.new end
    price
  end

  def highest_price
    price = self.prices.all(order: "value DESC").first
    unless price; price = Price.new end
    price
  end

  def lowest_price
    price = self.prices.all(order: "value DESC").last
    unless price; price = Price.new end
    price
  end
end
