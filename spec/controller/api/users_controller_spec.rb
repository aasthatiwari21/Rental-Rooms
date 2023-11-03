require 'rails_helper'
 
RSpec.describe Api::UsersController , type: :controller do 
	let(:role) { FactoryBot.create(:role) }
	let(:user_params) { FactoryBot.attributes_for(:user)}
	let(:invalid_user_params) { FactoryBot.attributes_for(:user, contact: "demo")}
	before do
		@user = FactoryBot.create(:user)
	end

	describe "sign_up" do

		it "creates a user" do
			debugger
			post :create, params: user_params.merge({role_id: role.id})
			expect(response).to have_http_status(200)
			expect(response.body) == (:user)
		end
	    it "user cannot create" do
	    	post :create, params: invalid_user_params.merge({role_id: role.id})
			debugger
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
	 		get :show, params: {id: "#{@user.id}" }
	 		
			expect(response).to have_http_status(:success)
	 	end
	 end
	 describe "update" do 
	 	it "update a particular user" do 
	 		put :update, params: {data: {name: "ram"},id: "#{@user.id}"}
	 	end
	 	it "if user is not updated" do 
	 		put :update , params: {}
	 	end
	 end
end