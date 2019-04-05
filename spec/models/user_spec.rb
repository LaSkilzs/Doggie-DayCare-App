require 'rails_helper'


RSpec.describe User, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:user)).to be_valid
  end

  let(:user) {build(:user)}
  context 'user model  validations' do
   it {should validate_presence_of(:name)}
   it {should validate_presence_of(:email)}
   it {should validate_presence_of(:username)}
   it {should validate_presence_of(:role)}
   it {should validate_presence_of(:password_digest)}
  end

  context 'user model format' do
    it {should validate_length_of(:username).is_at_least(5)}
    it {should validate_length_of(:password_digest).is_at_least(8)}
    it {expect(user).to validate_uniqueness_of(:email)}
    it {expect(user).to validate_uniqueness_of(:username)}
    it {expect(user).to validate_uniqueness_of(:password_digest)}
  end
 

  context 'user model associations' do
    it {should have_many(:owners)}
    it {should have_many(:walkers)}
  end


end
