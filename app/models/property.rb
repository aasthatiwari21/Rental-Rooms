class Property < ApplicationRecord
	belongs_to :user

	has_many :reviews ,dependent: :destroy
	
	enum :furnishing,[:unfurnished,:semi_furnished,:fully_furnished]
	enum :resident_type,[:bachelor,:family]
	validates :bathroom,presence:true,numericality: {greater_than:0}
	validates :bathroom,presence:true,numericality: {greater_than:0}
	validates :rent,presence:true,numericality: {greater_than:0}
	 validates :listed_by,inclusion: {in: %w(Broker Owner),message: "Select Broker and Owner"}
	has_many_attached :images
	belongs_to :property_type
	enum :availability_status,[:available,:unavailable]
   enum status: [:pending, :processing, :failed, :succeed]
# 	def self.ransackable_attributes(auth_object = nil)
  #   	["blob_id", "created_at", "id", "name", "record_id", "record_type", "address", "availability_status", "bathroom", "bedroom", "created_at", "description", "furnishing", "id", "latitute", "listed_by", "longitude", "property_type_id", "rent", "resident_type", "size_sq_ft", "updated_at", "user_id"]
  # 	end
  # 	def self.ransackable_associations(auth_object = nil)
  #   ["images_attachments", "images_blobs", "property_type", "reviews", "user"]
  # end
end
