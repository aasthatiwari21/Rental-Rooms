ActiveAdmin.register Review do
  actions :all ,except: [:edit, :new]
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :rating, :comment, :user_id, :property_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:rating, :comment, :user_id, :property_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

    attributes_to_display = Review.new.attributes.keys - ["created_at","updated_at"]

    # custom_filter

    filter :user
      filter :rating, as: :select, :collection => ["1","2", "3", "4" , "5"]
end
