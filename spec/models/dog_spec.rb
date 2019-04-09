require 'rails_helper'

RSpec.describe Dog, type: :model do
  it 'should create a factory' do
    expect(FactoryBot.build(:dog)).to be_valid
  end

  context 'dog model validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:age)}
    it {should validate_presence_of(:breed)}
    it {should validate_presence_of(:size)}
    it {should validate_presence_of(:restrictions)}
    it {should validate_presence_of(:image)}
    it {should validate_presence_of(:friendliness)}
  end
  context 'dog model format' do
    it {should validate_numericality_of(:age)}
  end
  context 'dog model associations' do
    it {belong_to(:owner)}
    it {have_many(:dogs)}
    it {have_many(:appointments)}
    it {have_many(:services)}
    it {have_many(:walkers)}
  end
end
