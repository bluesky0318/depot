class Order < ActiveRecord::Base
	validates :name,:address,:email,:pay_title, :presence => true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i,
    			message: "Invalid mail format" }

    has_many  :line_items, :dependent => :destroy
	PAYMENT_TYPES = ["Check","Credit card","Purchase order"]

	public def add_line_itmes_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
		end
	end
end
