require 'rails_helper'
RSpec.describe User , type: :model do

	describe "it belongs to role" do 
	 	it {should belong_to(:role)}
	end

	describe "it has many properties" do 
		it {should have_many(:properties)}
	end

	describe "it has many reviews" do 
		it {should have_many(:reviews)}
	end
	
  it 'is valid with valid attributes' do
    user = create(:user)
    expect(user).to be_valid
  end

  it 'is not valid without a role' do
    user = build(:user, role: nil)
    expect(user).to_not be_valid
  end
  describe '#email' do
    it 'validates presence' do
      record = User.new
      record.email = '' 
      record.validate 
      expect(record.errors[:email]).to include("can't be blank")
    end
  end
  it do
    should validate_inclusion_of(:contact).
      in_range(0..10).
      with_high_message("Contact ,must be atleast 10 digits")
  end
end