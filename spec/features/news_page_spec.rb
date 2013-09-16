require 'spec_helper'

describe 'Страница новости' do

  subject { page }

  before do
    visit news_page
  end

  it 'должна отображать заголовок "Новости компании"'
  it 'должна отображать новости'
end
