require 'spec_helper'

describe Article do

  context '#associations' do
    it { should have_many(:article_countries) }
    it { should have_many(:countries).through(:article_countries) }
  end

  context '#validations' do
    [:short_title, :title, :content].each do
      |value| it { should validate_presence_of(value) }
    end

    #it { should validate_uniqueness_of(:short_title) }
    #it { should validate_uniqueness_of(:title) }
    it { should ensure_length_of(:short_title).is_at_least(5).is_at_most(20) }
    it { should ensure_length_of(:title).is_at_least(5).is_at_most(40) }
    it { should ensure_length_of(:content).is_at_least(5).is_at_most(250) }
  end

  context '#methods' do
    let(:article) { FactoryGirl.build(:article) }

    it 'returns article title' do
      article.title.should eql 'test_title'
    end

  end
end
