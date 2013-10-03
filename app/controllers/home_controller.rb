class HomeController < ApplicationController
  def index
    @hits = Tour.hits
    date = DatePrice.nearest
    @nearest = date.tour unless date.nil?
    @nearest_date = date.day_of
    @bus_tour = RestType.find_by_title('Автобусный тур')
    @sea_rest = RestType.find_by_title('отдых в крыму')
    @flight = RestType.find_by_title('Экскурсионные авиа туры')
    @dayoff_rest = RestType.find_by_title('туры выходного дня')
  end
end
