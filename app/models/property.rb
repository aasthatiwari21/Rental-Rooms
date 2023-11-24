class Property < ApplicationRecord
	
	belongs_to :user
	has_one :payment
	has_many :reviews ,dependent: :destroy
	enum :furnishing,[:unfurnished,:semi_furnished,:fully_furnished],presence:true
	enum :resident_type,[:bachelor,:family],presence: true
	validates :bathroom,presence:true,numericality: {greater_than:0}
	validates :bathroom,presence:true,numericality: {greater_than:0}
	validates :rent,presence:true,numericality: {greater_than:0}
	validates :listed_by,inclusion: {in: %w(Broker Owner),message: "Select Broker and Owner"}
	has_many_attached :images
	belongs_to :property_type
	enum :availability_status,[:available,:unavailable]

end
