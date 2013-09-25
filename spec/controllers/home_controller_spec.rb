require 'spec_helper'

describe HomeController do
  let!(:alltours) { FactoryGirl.create_list(:published_tour, 12) }
  let(:sale_shits) { Tour.published.order('rating DESC').first(10) }

  let(:nearest_tour) do
    DatePrice.where('deadline_date > ?', Date.today).order('deadline_date ASC').first.try(:tour)
  end

  let!(:just_try) do
    FactoryGirl.create(:tour)
    just_try.date_prices = FactoryGirl.create_list(:dateprice, 10)
  end

  describe "GET 'index'" do
    it 'returns http success' do
      visit root_path
      response.should be_success
    end

    it 'should have 10 hits of sales' do
      get :index
      assigns(:hits).should eq(sale_shits)
    end

    it 'should have nearest bus tour' do
      get :index
      assigns(:nearest).should eq(nearest_tour)
    end
  end
end
