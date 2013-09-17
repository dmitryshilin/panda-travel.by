require 'spec_helper'

describe Contact do
  context '#validates' do
    [:type, :description].each do
      |value| it { should validate_presence_of(value) }
    end
    it { should ensure_length_of(:type).is_at_least(3).is_at_most(20) }
  end

  context '#methods' do
  end

  context '#associations' do
    it { should belong_to(:manager) }
  end
end