require 'spec_helper'

describe HomeController do
  let!(:alltours) { FactoryGirl.create_list(:published_tour, 12) }
  let(:sale_shits) { Tour.published.order('rating DESC').first(10) }
  let(:nearest_tour) { DatePrice.where('deadline_date > ?', Date.today).order('day_of ASC').first.try(:tour) }

  describe "GET 'index'" do
    it "returns http success" do
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
