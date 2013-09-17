require 'spec_helper'

describe Step do

  context '#associations' do
    it { should belong_to(:tour) }
  end

  context '#validations' do
    [:number, :description].each do
      |value| it { should validate_presence_of(value) }
    end

    it { should validate_uniqueness_of(:number)}
    it { should validate_numericality_of(:number).is_greater_than_or_equal_to(1) }
    it { should ensure_length_of(:description).is_at_least(5).is_at_most(250) }
  end

end