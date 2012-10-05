class Product < ActiveRecord::Base
  has_many :prices
  attr_accessible :ASIN, :name
end
