class PropertySerializer
  include FastJsonapi::ObjectSerializer

  attributes :id,:furnishing,:property_type_id,:bathroom,:bedroom,:rent,:address,:resident_type,:description, :user_id , images: []

  attributes :property_reviews do |object, params|
    ReviewSerializer.new(object.reviews, current_user: params[:user])
  end
end
