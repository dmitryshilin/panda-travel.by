require 'spec_helper'

describe 'Страница Виза' do
  let!(:visa) { FactoryGirl.create(:visa) }

  subject { page }

  before do
    visit visas_path
  end

  it 'имеет header'
  it 'имеет меню'
  it 'имеет панель контактов'
  it 'имеет footer'
  it 'имеет описание'
  it 'имеет ссылки на страны'
  it 'имеет виджет Лучшая страна'
  it 'имеет виджет Н овости'
end
