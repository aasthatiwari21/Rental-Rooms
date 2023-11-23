require 'rails_helper'
 
RSpec.describe Api::UsersController , type: :controller do 
	let(:role) { FactoryBot.create(:role) }
	let(:user_params) { FactoryBot.attributes_for(:user)}
	let(:invalid_user_params) { FactoryBot.attributes_for(:user, contact: "demo")}
	let(:user) {FactoryBot.create(:user)}
	
	describe "sign_up" do
		it "creates a user" do
			post :create, params: user_params.merge({role_id: role.id})
			expect(response).to have_http_status(200)
			expect(response.body) == (:user)
		end

	  it "user cannot create" do
	    post :create, params: invalid_user_params.merge({role_id: role.id})
			expect(response).to have_http_status(422)
	  end
	end

	describe "index" do
		it "See all the users" do 
			get :index
			expect(response).to have_http_status(:success)
		end
	end

	describe "show" do 
	 	it "show a particular user" do 
	 		get :show, params: {id: user.id}	
			expect(response).to have_http_status(:success)
	 	end
	end

	describe "update" do 
	 	it "update a particular user" do 
	 		put :update, params: {name: "ram",id: user.id}
	 		expect(response).to have_http_status(:success)
	 	end

	 	it "if user is not updated" do 
	 		put :update , params: {id: user.id ,contact: "777"}
	 		data = JSON.parse(response.body)
	 		expect(data["errors"]["contact"].first).to eq("should   be atleast 10 digits")
	 		expect(response).to have_http_status(422)
	 	end
	end
	 describe "delete" do 
	 	it "it deletes the user" do 
		  delete :destroy, params: {id: user.id}, format: :json
		  expect(response).to have_http_status(200)
	 end
	end
end