class LineItem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product

	public def total_price
       product.price * quantity
    end
end
