require 'spec_helper'

describe 'countries/index.html.haml' do
  let(:country) { FactoryGirl.build(:country) }

  it 'displays all the country titles' do
    assign(:countries, [country])

    render

    expect(rendered).to match country.title
  end
end
