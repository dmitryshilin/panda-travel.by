require 'spec_helper'

describe 'Partial Вы смотрели' do
  let!(:tour) { FactoryGirl.create(:tour) }

  subject { page }

  before do
    visit tours_path
    click_link(tour.short_title)
  end

  context 'отображает заголовок Вы смотрели' do
    it { should have_css('h4', text: 'Вы смотрели:') }
  end

  context 'отображает короткий заголовок тура' do
    it { should have_content(tour.short_title) }
  end

  context 'отображает минимальную цену тура' do
    it { should have_content(tour.price) }
  end
end
