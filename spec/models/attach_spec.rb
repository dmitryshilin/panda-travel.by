require 'spec_helper'

describe Attach do
  context '#validates' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:url) }
    it { should ensure_length_of(:title).is_at_least(5).is_at_most(100) }
    it { should ensure_length_of(:url).is_at_least(10).is_at_most(100) }
  end

  context '#association' do
    it { should belong_to(:tour) }
  end
end
