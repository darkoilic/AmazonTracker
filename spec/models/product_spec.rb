require 'spec_helper'

describe Product do
  before(:each) do
    @product = FactoryGirl.build(:product)
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
    @product.ASIC = nil
    @product.should_not be_valid
  end

  it {should respond_to(:name)}
  it {should respond_to(:ASIC)}
  it {should respond_to(:prices)}
end
