require 'spec_helper'

describe 'Страница туров' do

  subject { page }

  before do
    visit tours_path
  end

  it 'должна отображать заголовок "Каталог туров"'
  it 'должна отображать туры'
  it 'должна отображать верное количество туров'
end
