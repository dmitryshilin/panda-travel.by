require 'spec_helper'

describe Country do

  context '#associations' do
    it { should have_many(:articles).through(:article_countries) }
    it { should have_many(:article_countries) }
    it { should have_many(:tours).through(:country_tours) }
    it { should have_many(:country_tours) }
  end

  context '#validations' do
    [:title, :description, :region, :rating].each do
      |value| it { should validate_presence_of(value) }
    end

    it { should validate_uniqueness_of(:title) }
    it { should ensure_length_of(:title).is_at_least(2).is_at_most(30) }
    it { should ensure_length_of(:description).is_at_least(5).is_at_most(250) }

    it { should validate_numericality_of(:rating).is_greater_than_or_equal_to(0) }
  end

end
