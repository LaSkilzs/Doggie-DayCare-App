require 'rails_helper'

RSpec.describe Owner, type: :model do
 it 'should create a valid factory' do
  expect(FactoryBot.build(:owner)).to be_valid
end

context 'owner model validations' do
  it {should validate_presence_of(:address)}
  it {should validate_presence_of(:city)}
end
context 'owner model associations' do
  it {belong_to(:user)}
end
end
