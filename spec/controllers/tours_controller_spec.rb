require 'spec_helper'


describe ToursController do

  let (:published_tour) { FactoryGirl.create(:published_tour) }

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      get 'show', id: published_tour
      response.should be_success
    end

    it 'should render propper tour' do
      get :show, id: published_tour
      assigns(:tour).should eq(published_tour)
    end
  end


end
