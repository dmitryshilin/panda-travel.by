require 'spec_helper'

describe 'news/index.html.haml' do
  let(:news) { FactoryGirl.build(:news) }

  it 'displays all the news' do
    assign(:all_news, [news])
    render partial: 'layouts/news'
    expect(rendered).to match news.short_title
  end
end
