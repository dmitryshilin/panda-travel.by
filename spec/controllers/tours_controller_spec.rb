require 'spec_helper'


describe ToursController do

  describe "GET 'index'" do
    it "returns http success" do
      get 'index'
      response.should be_success
    end
  end

# describe "GET #show" do
#   it "assigns the requested contact to @contact" do
#     # tour = FactoryGirl.create(:tour)
#     get :show, id: 1
#     response.should be_success
#   end
# end

  describe "GET 'show'" do
    it "returns http success" do
      tour = FactoryGirl.create(:tour)
      get 'show', id: tour.id
      response.should be_success
    end
  end


end
