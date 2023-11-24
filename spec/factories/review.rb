require 'faker'
FactoryBot.define do
	factory :review do 
		rating {5}	
		comment {"hhhjhjdghghjkhkhkjce"}
		user {FactoryBot.create(:user)}
		property {FactoryBot.create(:property)}
		association :user
		association :property
	end
end
