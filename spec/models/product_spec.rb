require 'spec_helper'

describe Product do
  before(:each) do
    FactoryGirl.create(:price)
    @product = FactoryGirl.create(:product)
  end

  subject(@product)

  it "is valid with proper values" do
    @product.should be_valid
  end

  it "requires name field" do
    @product.name = nil
    @product.should_not be_valid
  end

  it "requires ASIC field" do
    @product.ASIN = nil
    @product.should_not be_valid
  end

  it "requires ASIC to be 10 digit long" do
    @product.ASIN = "ABCDEFGHIJ"
    @product.should be_valid

    @product.ASIN = "ABCDEFGH"
    @product.should_not be_valid
  end


  it {should respond_to(:name)}
  it {should respond_to(:ASIN)}
  it {should respond_to(:prices)}
  it {should respond_to(:current_price)}
  it {should respond_to(:highest_price)}
  it {should respond_to(:lowest_price)}

  it "returns a valid current price" do
    @product.current_price.respond_to?(value)
  end
end
