require 'rails_helper'

RSpec.describe 'Properties', type: :request do
  describe "DELETE /destroy" do
    let(:property) { FactoryBot.create(:property) }

    before do
      delete "/api/property#{property.id}"
    end

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end