require 'faker'
FactoryBot.define do 
	factory :user do
		name { Faker::Name.name }
		email { Faker::Internet.free_email}
		password {"123456"}
		password_confirmation {"123456"}
		contact {Faker::Number.decimal_part(digits: 10)}
		# role {FactoryBot.create(:role)}
		association :role
	end
end
