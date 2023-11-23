require 'rails_helper'

RSpec.describe Api::ReviewsController , type: :controller do 
	let(:user) {FactoryBot.create(:user)}
	let(:property) {FactoryBot.create(:property)}
	let(:review) {FactoryBot.create(:review)}
	let(:review_params) {FactoryBot.attributes_for(:review)}
	let(:invalid_review_params) { FactoryBot.attributes_for(:review)}
	before do 
		sign_in user
	end
	describe "Review Index" do 
		it "It can be seen by all" do 
			get :index 
			expect(response).to have_http_status(200)
		end
	end

	describe "Create Review" do 
		it "It will create the reviews" do 
			post :create , params: review_params.merge(user_id: user.id , property_id: property.id)
			expect(response).to have_http_status(200)
		end
		it "It will not create the reviews" do 
		 	post :create ,params: {user_id: user.id, property_id: property.id}
		 	expect(response).to have_http_status(422)
		end
	end

	describe 'Show Reviews' do
    it 'returns a successful response' do
			get :show, params: { id: review.id }
      expect(response).to have_http_status(:success)
    end
  end

  describe "Update Reviews" do 
  	it "update the reviews" do 
  		put :update ,params: {rating: 5, id: review.id}
  		review.reload
  		expect(response).to have_http_status(:success)
  		expect(review.rating).to eq(5)
  	end
  	it "review is not updated" do 
  		put :update ,params: {id: review.id , rating: "4rrr"}
  		expect(response).to have_http_status(422)
  		# expect(review.rating).to eq("4rrr")
  	end
  end
  describe "Delete Reviews" do 
  	it "delete the reviews" do
  		delete :destroy , params: {id: review.id}
  		expect(response).to have_http_status(200)
  	end
  end
end