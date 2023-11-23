class DashboardController < ApplicationController
	def index
		@user = current_user
		if (current_user.role.name == "Owner" && current_user.role.name == "Broker")
			@property=Property.find(params[:id])
		end

	end
   
 private
 def property_params
    params.require(:property).permit(:furnishing,:size_sq_ft,:bathroom,:bedroom,:rent,:address,:resident_type,:description,:latitude,:longitude, :listed_by,:availability_status,:min_rent,:max_rent,:property_type_id , images: [])
  end
end
