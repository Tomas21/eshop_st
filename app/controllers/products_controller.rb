class ProductsController < ApplicationController
  def index
    @products = Product.all
  end

  def show
    @product = Product.find params[:id]
  end

private
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
