require 'spec_helper'

describe Manager do
  context '#validates' do
    it { should validate_presence_of(:name) }
    it { should ensure_length_of(:name).is_at_least(10).is_at_most(50) }
  end

  context '#association' do
    it { should have_many(:contacts) }
    it { should have_many(:tours).through(:manager_tours) }
  end

  context '#methods' do
  end
end