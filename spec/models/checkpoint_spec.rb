require 'spec_helper'

describe Checkpoint do

  context '#associations' do
    it { should belong_to(:tour) }
  end

  context '#validations' do
    it { should validate_presence_of(:title) }
    it { should ensure_length_of(:title).is_at_least(2).is_at_most(250) }
  end

end