require 'spec_helper'

describe Tour do
  let(:good_tour) { FactoryGirl.build :tour }
  let(:bad_tour) { FactoryGirl.build :empty_title_tour }

  context '#associations' do
    it { should have_many(:countries).through(:country_tours) }
    it { should have_many(:managers).through(:manager_tours) }
    it { should have_many(:images) }
    it { should have_many(:steps) }
    it { should have_many(:checkpoints) }
    it { should have_many(:date_prices) }
    it { should have_many(:rest_types).through(:rest_type_tours) }
    it do
      should have_many(:attaches)
    end
    it { should have_many(:visas).through(:visa_tours) }
  end

  context '#validations' do

    [:short_title, :title, :description, :published].each do
      |value| it { should validate_presence_of(value) }
    end

    it 'fields should to have propper length' do
      should ensure_length_of(:short_title).is_at_least(5).is_at_most(50)
      should ensure_length_of(:title).is_at_least(5).is_at_most(150)
      should ensure_length_of(:description).is_at_least(200).is_at_most(1000)
    end

    it 'should be unique values' do
      # pending
      should validate_uniqueness_of(:short_title)
      should validate_uniqueness_of(:title)
    end
  end

end
