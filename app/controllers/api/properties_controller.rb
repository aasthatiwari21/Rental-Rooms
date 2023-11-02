class Api::PropertiesController<ApplicationController
	skip_before_action :verify_authenticity_token

	def index
		properties=Property.includes(:user).available
		render json: PropertySerializer.new(properties)
	end

	def create
		 property = Property.new(property_params)
		if property.save
		 	render json: {data: property}
		 else
		 	render json: {errors: property.errors.messages}
		 end
	end

	def update
		property = Property.find(params[:id])
		if property.update(property_params)
			render json: {data: property}
		else
			render json: {errors: property.errors.messages}
		end
	end
	def destroy
		property= Property.find(params[:id])
		property.destroy
		render json: {errors: property.errors.messages}
	end
	def show
		property= Property.find(params[:id])
		render json: PropertySerializer.new(property)
	end
	def property_params
    	params.permit(:furnishing,:size_sq_ft,:bathroom,:bedroom,:rent,:address,:user_id,:resident_type,:description,:latitude,:longitude, :listed_by,:availability_status,:min_rent,:max_rent,:property_type_id , images: [])
    end
 end
