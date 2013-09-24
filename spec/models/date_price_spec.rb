require 'spec_helper'

describe DatePrice do

  context '#associations' do
    it { should belong_to(:tour) }
  end

  context '#validations' do
    [:day_of, :price, :special, :currency, :deadline_date].each do
      |value| it { should validate_presence_of(value) }
    end

    it { should validate_numericality_of(:price).is_greater_than_or_equal_to(0) }
    #it { should ensure_length_of(:currency).is_at_least(1).is_at_most(20) }
  end

end
