require 'faker'
FactoryBot.define do
	factory :property do 
		furnishing {"fully_furnished"}
		size_sq_ft {Faker::Number.decimal_part(digits: 3)}
		bathroom {Faker::Number.decimal_part(digits: 2)}
		bedroom {Faker::Number.decimal_part(digits: 2)}
		rent {Faker::Number.decimal_part(digits: 4)}
		address {Faker::Address.full_address}
		user {FactoryBot.create(:user)}
		resident_type {"family"}
		description {"this is for families"}
		listed_by {"Owner"}
		availability_status {"available"}
		property_type {FactoryBot.create(:property_type)}
	end
end
