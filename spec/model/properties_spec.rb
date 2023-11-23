RSpec.describe Property, type: :model do
  it 'is valid with valid attributes' do
    property = create(:property) 
    expect(property).to be_valid
  end

  it 'is not valid without a user association' do
    property = build(:property, user: nil)
    expect(property).to_not be_valid
  end

  it { should define_enum_for(:furnishing).with([:unfurnished,:semi_furnished, :fully_furnished]) }
  it { should define_enum_for(:resident_type).with([:bachelor, :family]) }
  it { should define_enum_for(:availability_status).with([:available,:unavailable])}

  describe Property do
    it { is_expected.to validate_presence_of :bathroom }
  end
  
   describe Property do
    it { is_expected.to validate_presence_of :bedroom }
  end

  describe Property do
    it { is_expected.to validate_presence_of :rent }
  end

  describe '#listed_by' do
    it { is_expected_to validate_inclusion_of(:listed_by).in("Broker","Owner") }
  end


   it 'belongs to a role' do
    role = create(:role) 
    user = create(:user, role: role)
    expect(user.role).to eq(role)
  end

  it 'has many properties' do
    user = create(:user) 
    property1 = create(:property, user: user)
    property2 = create(:property, user: user)
    expect(user.properties).to match_array([property1, property2])
  end
end