require 'spec_helper'

describe Visa do
  let(:good_visa) { FactoryGirl.build(:visa) }
  let(:bad_visa) { FactoryGirl.build(:bad_title_visa) }

  context '#association' do
    it { should have_many(:tours).through(:visa_tours) }
  end

  context '#validations' do
    [:title, :description].each do |value|
      it { should validate_presence_of(value) }
    end
    it { should ensure_length_of(:title).is_at_least(5).is_at_most(50) }
    it { should ensure_length_of(:description).is_at_least(50).is_at_most(1000) }

    it 'should be valid' do
      good_visa.should be_valid
    end

    it 'should be not valid' do
      bad_visa.should_not be_valid
    end
  end
end
