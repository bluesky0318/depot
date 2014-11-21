class LineItem < ActiveRecord::Base
	belongs_to :cart
	belongs_to :product
	belongs_to :order

	public def total_price
       product.price * quantity
    end
end
