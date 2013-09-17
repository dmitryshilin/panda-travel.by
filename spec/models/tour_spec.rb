require 'spec_helper'

describe Tour do
  # pending
  let(:very_good_tour) { FactoryGirl.create :tour }
  # let(:empty_titles_tour) { tour = FactoryGirl.create :bad_tour }

  it { should have_many(:countries).through(:country_tours) }
  it { should have_many(:managers).through(:manager_tours) }
  it { should have_many(:images) }
  it { should have_many(:steps) }
  it { should have_many(:checkpoints) }
  it { should have_many(:date_prices) }
  it { should have_many(:rest_types).through(:rest_type_tours) }
  it do
    pending
    should have_many(:attaches)
  end
  it { should have_many(:visas).through(:visa_tours) }

  it 'bad tour should not be valid' do
    # tour = FactoryGirl.build :tour
    p very_good_tour.short_title
    # should_not be valid @bad_tour.save
  end

  # it { should validate_uniqueness_of(:title) }
  # it { should validate_uniqueness_of(:title).scoped_to(:user_id, :category_id) }
  # it { should validate_presence_of(:body).with_message(/wtf/) }
  # it { should validate_presence_of(:title) }
  # it { should validate_numericality_of(:user_id) }
  # it { should ensure_inclusion_of(:status).in_array(['draft', 'public']) }
end
