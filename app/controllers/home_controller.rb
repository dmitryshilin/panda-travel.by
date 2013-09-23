class HomeController < ApplicationController
  before_filter :get_rest_types

  def index
    @hits = Tour.order('rating ASC').first(10)
    @nearest = date.tour if date = DatePrice.nearest
  end
end
