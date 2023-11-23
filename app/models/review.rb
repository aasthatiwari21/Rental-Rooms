class Review < ApplicationRecord
	belongs_to :user
	belongs_to :property
	def self.ransackable_attributes(auth_object = nil)
    	["comment", "created_at", "id", "property_id", "rating", "updated_at", "user_id"]
  	end

  	validates :rating, presence:true ,numericality: true
end
