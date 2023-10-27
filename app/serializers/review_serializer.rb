class ReviewSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id , :rating ,:comment , :user_id , :property_id
end
