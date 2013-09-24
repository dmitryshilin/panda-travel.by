class NewsController < ApplicationController
  def index
    @all_news = News.published
  end

  def show
    @news = News.published.find(params[:id])
    authorize! :read, @news
  end
end
