require 'rails_helper'

RSpec.describe 'Properties', type: :request do
  describe 'GET /index' do
    before do
      FactoryBot.create(:property)
      get '/api/properties'
    end
    
    it 'returns all properties' do
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /show' do
    it 'returns a successful response' do
      FactoryBot.create(:property)
      get '/api/properties/id', params: { id: property.id }
      expect(response).to have_http_status(:success)
    end
  end

end