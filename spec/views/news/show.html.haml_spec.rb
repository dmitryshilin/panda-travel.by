require 'spec_helper'

describe 'news/show.html.haml' do
  let(:news) { FactoryGirl.build(:news) }

  it 'displays news content' do
    assign(:news, news)
    render
    expect(rendered).to match news.content
  end
end
