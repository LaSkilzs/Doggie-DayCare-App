require 'rails_helper'

RSpec.describe Appointment, type: :model do
  it 'should create a valid factory' do
    expect(FactoryBot.build(:appointment)).to be_valid
  end
  context 'appointment model validations' do
    it {should validate_presence_of(:date)}
    it {should validate_presence_of(:start_time)}
    it {should validate_presence_of(:status)}
  end
  context 'appointment model associations' do
    it {belong_to(:walker)}
    it {belong_to(:dog)}
    it {belong_to(:service)}
    it {have_many(:invoice)}
  end
end
