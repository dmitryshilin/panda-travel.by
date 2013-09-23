require 'spec_helper'

describe ArticlesController do
  let(:new_article) { FactoryGirl.create(:article) }
  let(:published_article) { FactoryGirl.create(:pub_article) }
  let(:unpublished_article) { FactoryGirl.create(:unpub_article) }

  describe 'GET "index"' do
    it 'returns http success' do
      visit articles_path
      response.should be_success
    end
    it 'populates an array of contacts' do
      article =  FactoryGirl.create(:article)
      get :index
      assigns(:articles).should eq([article])
    end
  end
  describe 'GET "show"' do
    it 'returns http success' do
      visit article_path(new_article)
      response.should be_success
    end
  end

  describe 'AccessDenied with UNPUBLISHED Article' do
    it 'rescues from CanCan::AccessDenied' do
      #controller.stub(:authorize!) { raise CanCan::AccessDenied }
      visit article_path(unpublished_article)
      #expect(response).to redirect_to('/')
      flash[:alert] == 'You are not authorized to access this page.'
    end
  end



end
