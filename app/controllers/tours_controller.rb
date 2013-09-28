class ToursController < ApplicationController
  def index
    @tours = Tour.search params
  end

  def byresttypes
    @tours = RestType.find(params[:rest_type_id]).try(:tours)
    render :index
  end

  def show
    @tour = Tour.find(params[:id])
    @manager = @tour.first_manager
    @contacts = @manager.contacts
    @countries = @tour.countries
    @price = @tour.price
    @special_price = @tour.special_price
    @dates_of = @tour.dates_of
    @special_dates_of = @tour.special_dates_of
    @attaches = @tour.attaches
    @all_dates_of = @tour.all_dates_of.pluck(:day_of)
  end
end
