require 'rails_helper'

RSpec.describe Service, type: :model do
  it 'should create a valid factory' do
    expect(FactoryBot.build(:service)).to be_valid
  end

  context 'service model validations' do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:package)}
    it { should validate_presence_of(:bundle)}
    it { should validate_presence_of(:category)}
    it { should validate_presence_of(:max_time)}
    it { should validate_presence_of(:pkg_amount)}
    it { should validate_presence_of(:hourly_rate)}
  end
  context 'service model format' do
    it {should validate_numericality_of(:pkg_amount)}
    it {should validate_numericality_of(:hourly_rate)}
  end
  context 'service model associations' do
    it {have_many(:appointments)}
    it {have_many(:dogs)}
    it {have_many(:walkers)}
  end

end
