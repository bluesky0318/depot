class StoreController < ApplicationController
  def index	
  	@products = Product.find_products_for_sale
    @cart = current_cart
  end

  def add_to_cart
    @cart = find_cart
    product = Product.find(params[:id])
    @cart.add_product(product)
  end 
  
private
  def find_cart
    unless session[:cart] # if there's no cart in the session
      session[:cart] = Cart.new # add a new one
    end
      session[:cart] # return existing or new cart
   end 
end
