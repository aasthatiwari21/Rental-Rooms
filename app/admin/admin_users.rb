ActiveAdmin.register AdminUser do
  permit_params :email, :password, :password_confirmation
   attributes_to_display = AdminUser.new.attributes.keys - ["current_sign_in_at","sign_in_count","encrypted_password","reset_password_sent_at","reset_password_token","remember_created_at"]

    index do  attributes_to_display.each do |attribute|
        column attribute.to_sym  end
      actions
    end

  index do
    selectable_column
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

  config.filters = false

 

end
