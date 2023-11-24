
require 'rails_helper'

RSpec.describe 'Properties API', type: :request do
  let(:user) { create(:user, role: 'owner') } 
 
  describe 'POST /api/properties' do
    context 'when the user is an owner or broker' do
      it 'creates a new property' do
        sign_in(user) 
        post '/api/properties', params: { property: attributes_for(:property) }
 
        expect(response).to have_http_status(200)
      end
    end
 
    context 'when the user is not an owner or broker' do
      it 'returns a forbidden status' do
        sign_in(create(:user, role: 'seeker'))
 
        post '/api/properties', params: { property: attributes_for(:property) }
 
        expect(response).to have_http_status(403)
        expect(Property.count).to eq(0)
      end
    end
     context 'with invalid parameters' do
      before do
        post '/api/properties', params:
                          { property: {
                            bathroom: '',
                            bedroom: '',
                            rent: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
end