class Admin::ProductsController < ApplicationController

   before_action :authenticate_user!
   before_action :admin_required



  def new
     @product = Product.new
     @photo = @product.image
  end
 
  def create
     @product = Product.new(product_params)
 
    if @product.save
       redirect_to admin_products_path
    else
       render :new
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def index
     @products = Product.all
  end
 
  private
 
  def product_params
     # params.require(:product).permit(:title, :description,:quantity, :price, :photos_attributes => [:image] )
      params.require(:product).permit(:title, :description, :quantity, :image)
  end

end
