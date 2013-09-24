class HomeController < ApplicationController
  def index
    @hits = Tour.published.order('rating DESC').first(10)
    date = DatePrice.nearest
    @nearest = date.tour unless date.nil?
  end
end
