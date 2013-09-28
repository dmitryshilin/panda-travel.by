require 'spec_helper'

describe HomeController do
  # let!(:alltours) { FactoryGirl.create_list(:published_tour, 20) }
  # let(:sales_hits) { Tour.published.order('rating DESC').first(10) }

  let!(:alltours) { Tour.all }
  let(:sales_hits) { Tour.published.order('rating DESC').first(10) }
  let(:best_country) { Country.order('rating DESC').first }

  let(:nearest_tour) do
    DatePrice.where('deadline_date > ?', Date.today).order('deadline_date ASC').first.try(:tour)
  end

  # let!(:just_try) do
  #   FactoryGirl.create(:tour)
  #   just_try.date_prices = FactoryGirl.create_list(:dateprice, 10)
  # end

  before(:each) { get :index }

  describe "GET 'index'" do
    it 'returns http success' do
      response.should be_success
    end
  end

  describe 'should have good vars' do
    it 'should have 10 hits of sales' do
      assigns(:hits).should eq(sales_hits)
    end

    it 'should have nearest bus tour' do
      assigns(:nearest).should eq(nearest_tour)
    end

    it 'should have best country var' do
      assigns(:best_country).should eq(best_country)
    end


  end
end
