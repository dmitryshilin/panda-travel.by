class NewsController < ApplicationController
  def index
    @all_news = News.published
  end

  def show
  end
end
