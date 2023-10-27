class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes *[ :id, :name, :contact, :city, :email, :password, :password_confirmation , :role_id]

  attributes :user_properties do |object, params|
    PropertySerializer.new(object.properties, current_user: params[:user])
  end
end
