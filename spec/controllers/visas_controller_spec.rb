require 'spec_helper'

describe VisasController do
  let(:new_visa) { FactoryGirl.create(:visa) }

  describe 'GET "index"' do
    it 'returns http success' do
      visit visas_path
      response.should be_success
    end
    it 'populates an array of contacts' do
      visa = FactoryGirl.create(:visa)
      get :index
      assigns(:visas).should eq([visa])
    end

  end

  describe 'GET "show"' do
    it 'returns http success' do
      visit visa_path(new_visa)
      response.should be_success
    end
  end

end
