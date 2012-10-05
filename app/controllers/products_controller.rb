class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:success] = "Product #{@product.name} successfully created."
      redirect_to @product
    else
      render 'new'
    end
  end
end
