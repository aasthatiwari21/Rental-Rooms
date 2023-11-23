ActiveAdmin.register User, as: "users" do
  permit_params :name, :email, :password, :password_confirmation, :contact, :city, :role_id
   actions :all,except:[:edit,:new]
  attributes_to_display = User.new.attributes.keys - ["password","remember_created_at", "reset_password_sent_at", "reset_password_token", "username","encrypted_password"]

    index do  attributes_to_display.each do |attribute|
        column attribute.to_sym  end
      actions
    end
   menu priority: 1
#custom filters
   filter :role
   filter :name 
   filter :email
   filter :city 
end



