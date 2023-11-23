require 'rails_helper'
RSpec.describe Payment , type: :model do

	describe "it belongs to user" do 
	 	it {should belong_to(:user)}
	end
	
	describe "it belongs to property" do 
	 	it {should belong_to(:property)}
	end

end