require 'rails_helper'

RSpec.describe Invoice, type: :model do
 it 'should create a valid factory' do
  expect(FactoryBot.build(:invoice)).to be_valid
 end

 context 'invoice model validations' do
  it {should validate_presence_of(:amount)}
  it {should validate_presence_of(:walked)}
  it {should validate_presence_of(:walk_rating)}
  it {should validate_presence_of(:notes)}
  it {should validate_presence_of(:owner_comments)}
  it {should validate_presence_of(:walker_comments)}
 end
 context 'invoice model format' do
  it {should validate_numericality_of(:amount)}
  it {should validate_numericality_of(:walk_rating)}
 end
 context 'invoice model associations' do
  it {have_many(:owners)}
  it {have_many(:invoices)}
 end


end
