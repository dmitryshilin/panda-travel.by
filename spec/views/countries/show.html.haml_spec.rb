require 'spec_helper'

describe "countries/show.html.haml" do
  let(:country) { FactoryGirl.build(:country) }

  it 'displays country description' do
    assign(:country, country)
    render
    expect(rendered).to match country.description
  end
end
