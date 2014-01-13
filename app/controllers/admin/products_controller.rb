class Admin::ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find params[:id]
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_url
    else
      render 'new'
    end
  end

  def edit
    @product = Product.find params[:id]
  end

  def update
    @product = Product.find params[:id]
    @product.update product_params
    redirect_to admin_products_url
  end

  def destroy
    @product = Product.find params[:id]
    @product.destroy
    redirect_to admin_products_url
  end
  
  def product_params
    params[:product].permit([
      :name,
      :description,
      :price,
      :image_url,
      :availability
      ])
  end

end
