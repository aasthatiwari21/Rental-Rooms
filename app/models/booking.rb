class Booking < ApplicationRecord
	belong_to :user 
	belongs_to :property
end
