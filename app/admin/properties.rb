ActiveAdmin.register Property do
  actions :all,except:[:edit,:new]
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :furnishing, :size_sq_ft, :bathroom, :bedroom, :rent, :address, :resident_type, :description, :latitute, :longitude, :listed_by, :property_type_id, :user_id, :availability_status
  #
  # or
  #
  # permit_params do
  #   permitted = [:furnishing, :size_sq_ft, :bathroom, :bedroom, :rent, :address, :resident_type, :description, :latitute, :longitude, :listed_by, :property_type_id, :user_id, :availability_status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  attributes_to_display = Property.new.attributes.keys - ["latitute","longitude","created_at","updated_at"]

    index do  attributes_to_display.each do |attribute|
        column attribute.to_sym  end
      actions
    end
  filter :property_type
  filter :listed_by, as: :select, :collection => ["Owner","Broker"]
  filter :resident_type, as: :select, :collection => ["Bachelor","Family"]
  filter :furnishing,as: :select, :collection => ["Unfurnished","Semi-furnished","Fully-Furnished"]
  filter :bedroom 
  filter :bathroom
  filter :rent 
  filter :address
  filter :size_sq_ft

end
