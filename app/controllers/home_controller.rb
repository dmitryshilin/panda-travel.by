class HomeController < ApplicationController
  def index
    @hits = Tour.order('rating ASC').first(10)
    @nearest = date.tour if date = DatePrice.nearest
  end
end
