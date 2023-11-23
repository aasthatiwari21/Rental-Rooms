require 'rails_helper'
 
RSpec.describe PropertyCreationService do
  describe '#perform_some_action' do
    it 'performs some action on the property' do
      property = FactoryBot.create(:property) 
 
      service = PropertyCreationService.new(property)
      result = service.perform_some_action
      expect(result).to be_truthy
    end
  end
end