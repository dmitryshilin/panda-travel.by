class NewsController < ApplicationController
  def index
    @all_news = News.all
  end

  def show
    @news = News.friendly.find params[:id]
    authorize! :read, @news
  end
end
