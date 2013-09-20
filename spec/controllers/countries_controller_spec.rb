require 'spec_helper'

describe CountriesController do
  let!(:country) { FactoryGirl.create(:country) }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      response.should be_success #render_template :index
    end

    it 'assigns all news to @countries' do
      get :index
      assigns(:countries).should eq([country])
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, id: country
      response.should be_success #render_template :show
    end

    it 'assigns the requested news to @country' do
      get :show, id: country
      assigns(:country).should eq(country)
    end
  end
end
