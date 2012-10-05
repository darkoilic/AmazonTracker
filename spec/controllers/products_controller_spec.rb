require 'spec_helper'

describe ProductsController do

  describe "GET 'new'" do
    it "returns http success" do
      get 'new'
      response.should be_success
    end

    it "returns a new product" do
      get 'new'
      assigns(:product).attributes.should eq(Product.new.attributes)
    end
  end


  describe "POST 'create'" do

    context "with valid attributes" do

      it "creates a new product" do
        expect {
          post :create, product: FactoryGirl.attributes_for(:product)
        }.to change(Product, :count).by(1)
      end

      it "redirects to the new product" do
        post :create, product: FactoryGirl.attributes_for(:product)
        response.should redirect_to Product.last
      end
    end

    context "with invalid attributes" do

      it "does not save the new product" do
        expect {
          post :create, product: FactoryGirl.attributes_for(:invalid_product)
        }.to_not change(Product, :count)
      end

      it "should render the 'new' action" do
        post :create, product: FactoryGirl.attributes_for(:invalid_product)
        response.should render_template :new
      end

      it "should pass the partial data to 'new' action" do
        post :create, product: FactoryGirl.attributes_for(:invalid_product)
        assigns(:product).ASIN.should eq(FactoryGirl.attributes_for(:invalid_product)[:ASIN])
      end
    end
  end

end
