class HomeController < ApplicationController
  def index
    @hits = Tour.published.order('rating DESC').first(10)
    if date = DatePrice.nearest
      @nearest = date.tour
    end


  end
end
