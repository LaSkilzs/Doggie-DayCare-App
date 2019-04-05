require 'rails_helper'

RSpec.describe Walker, type: :model do
 it 'should create a valid factory' do
  expect(FactoryBot.build(:walker)).to be_valid
 end
 context 'walker model validations' do
  it {should validate_presence_of(:age) }
  it {should validate_presence_of(:experience) }
  it {should validate_presence_of(:rating) }
 end
 context 'walker model format' do
   it {should validate_numericality_of(:age)}
   it {should validate_numericality_of(:rating)}
 end
 context 'walker model associations' do
  it  { belong_to(:user)}
  it  { have_many(:appointments)}
  it  { have_many(:dogs)}
  it  { have_many(:services)}
 end
end
