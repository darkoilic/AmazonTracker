class ProductsController < ApplicationController
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.save
      flash[:success] = "Product #{@product.name} successfully created."
      redirect_to products_path
    else
      render 'new'
    end
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "Product removed."
    respond_to do |format|
      format.html { redirect_to products_path }
      format.js
    end
  end
end
