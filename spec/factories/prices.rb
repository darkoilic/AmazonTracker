# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :price do
    value 1.5
    product
  end
end
