# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :product do
    name "MyProduct"
    ASIN "ABCDEFGHIJ"
  end

  factory :invalid_product, parent: :product do |f|
    f.name nil
  end
end
