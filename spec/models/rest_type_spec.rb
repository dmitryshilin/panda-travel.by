require 'spec_helper'

describe RestType do

  context '#associations' do
    it { should have_many(:tours).through(:rest_type_tours) }
    it { should have_many(:rest_type_tours) }
  end

  context '#validations' do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title) }
    it { should ensure_length_of(:title).is_at_least(3).is_at_most(20) }
  end

end
