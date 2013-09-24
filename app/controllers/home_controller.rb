class HomeController < ApplicationController
  def index
    @hits = Tour.published.order('rating DESC').first(10)
    # @hits = Tour.all
    @nearest = date.tour if date = DatePrice.nearest
  end
end
