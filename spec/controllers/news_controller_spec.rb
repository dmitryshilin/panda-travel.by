require 'spec_helper'

describe NewsController do
  let!(:pub_news) { FactoryGirl.create(:pub_news) }

  describe 'GET #index' do
    it 'returns http success' do
      get :index
      response.should be_success # render_template :index
    end

    it 'assigns all news to @all_news' do
      get :index
      assigns(:all_news).should eq([pub_news])
    end
  end

  describe 'GET #show' do
    it 'returns http success' do
      get :show, id: pub_news
      response.should be_success # render_template :show
    end

    it 'assigns the requested news to @news' do
      get :show, id: pub_news
      assigns(:news).should eq(pub_news)
    end
  end
end
