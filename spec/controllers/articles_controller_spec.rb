require 'spec_helper'

describe ArticlesController do
  let(:new_article) { FactoryGirl.build(:article) }
  let(:published_article) { FactoryGirl.create(:pub_article)}
  let(:unpublished_article) {FactoryGirl.create(:unpub_article)}
  let(:user) {User.new}

  describe "GET 'index'" do
    it "returns http success" do
      visit articles_path
      response.should be_success
    end
  end

  describe "GET 'show'" do
    it "returns http success" do
      visit article_path(new_article)
      response.should be_success
    end
  end

  describe "ge"

end
