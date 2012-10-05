class Product < ActiveRecord::Base
  has_many :prices
  attr_accessible :ASIN, :name

  validates :name, presence: true
  validates :ASIN, presence: true, :length => { :is => 10 }

end
