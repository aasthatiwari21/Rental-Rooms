class PropertiesController < ApplicationController
   before_action :authenticate_user!
   FILTER_PARAMS = %w(listed_by bedroom bathroom size_sq_ft furnishing)

  def index  
    @properties = Property.includes(:property_type).available
    FILTER_PARAMS.each do |fitler_param|
      @properties = @properties.where("#{fitler_param} = ?",  params[fitler_param.to_sym]) if params[fitler_param.to_sym].present?
    end  
    if params[:min_rent].present?
      @properties = @properties.where("rent >= ?", params[:min_rent])
    end 
    if params[:max_rent].present?
      @properties = @properties.where("rent <= ?", params[:max_rent]) 
    end
    # @brokered_property = Property.all.where(listed_by: "Broker")

  end


  def show
    @property=Property.find(params[:id])
  end

  def new
    @property=Property.new
  end
  def create
    @property= current_user.properties.new(property_params)
    if @property.save
    	@seeker= Role.find_by(name: 'Seeker').users.all
    	@seeker.each do |seeker|
   			NewPropertyMailer.new_property_notification(seeker).deliver_now
   		end
      redirect_to @property,notice: 'Property is saved succesfully'
    else
      render "/property/show"
    end
  end

  def edit
    @property=Property.find(params[:id])
  end
  def update
    @property=Property.find(params[:id])
      authorize! :manage,@property
    if @property.update(property_params)
      redirect_to @property,notice: 'Property was succesfully edited'
    else
      render :new
    end
  end
  def destroy
    @property=Property.find(property_params[:id])
    authorize! :manage,@property
    @property.destroy

    redirect_to root_path
  end
  def authorize_owner_or_broker
    unless current_user.owner? || (current_user.broker? && current_user == @property.user)
      redirect_to root_path, alert: 'You are not authorized to perform this action.'
    end
  end

  def all_properties
    @properties= Property.where(listed_by: ['owner','broker'])
  end

  def search
    if params[:search].blank?
      redirect_to properties_path and return
    else
      @param = params[:search].downcase
      @result = Property.all.where("lower(address) LIKE :search",search: "%#{@param}%")
    end
  end

  def contact_owner
     @property = Property.find(params[:id])
    @owner = @property.user
  end

   def booking
     @property = Property.find(params[:id])
     @owner = @property.user
     @rent= @property.rent
  end

    def property_params
    params.require(:property).permit(:furnishing,:size_sq_ft,:bathroom,:bedroom,:rent,:address,:resident_type,:description,:latitude,:longitude, :listed_by,:availability_status,:min_rent,:max_rent,:property_type_id , images: [])
  end
end
