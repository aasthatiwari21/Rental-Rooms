require 'rails_helper'

RSpec.describe Api::PropertiesController , type: :controller do 
	let(:user) {FactoryBot.create(:user)}
	let(:property_type) {FactoryBot.create(:property_type)}
	let(:property_params) { FactoryBot.attributes_for(:property)}
	let(:invalid_property_params) { FactoryBot.attributes_for(:property ,rent: "ghjghg")}
	let(:property) {FactoryBot.create(:property)}
	before do
		sign_in user
	end

	describe 'index' do
    it 'returns a successful response' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end
	describe "create property" do 
		it "it creates the property" do 
			post :create , params: property_params.merge(user_id: user.id , property_type_id: property_type.id)
			expect(response).to have_http_status(200)
		end

		it "property is not created" do
		 post :create ,params: invalid_property_params.merge({user_id: user.id})
		 expect(response).to have_http_status(422)
		end

	end

	describe 'show property' do
    it 'returns a successful response' do
			get :show, params: { id: property.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "update" do 
  	it "update the property" do 
  		put :update ,params: {id: property.id ,bathroom: 4 }
  		property.reload
  		expect(response).to have_http_status(:success)
  		expect(property.bathroom).to eq(4)
  	end
  	it "property is not updated" do 
  		put :update ,params: {id: property.id , rent: "hhh"}
  		data = JSON.parse(response.body)
  		expect(data["errors"]["rent"].first).to eq("is not a number")
  		expect(response).to have_http_status(422)
  	end
  end
  
  describe "delete" do 
  	it "delete the property" do
  		delete :destroy , params: {id: property.id}
  		expect(response).to have_http_status(200)
  	end
  end
end
