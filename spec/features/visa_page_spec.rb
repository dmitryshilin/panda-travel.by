require 'spec_helper'

describe 'Страница Визы'  do
  let!(:visa) { FactoryGirl.create(:visa) }

  subject { page }

  before do
    visit visas_path
    click_link(visa.title)
  end

  it 'имеет header'
  it 'имеет меню'
  it 'имеет панель контактов'
  it 'имеет footer'
  context 'имеет заголовок' do
    it { should have_css('h1', text: visa.title) }
  end
  it 'имеет виджет Новости'
  it 'имеет виджет Лучшая страна'
end
