class ToursController < ApplicationController
  before_action :store_history

  def index
    @tours = Tour.search params
    # @tours = Tour.all
  end

  def byresttypes
    if params[:rest_type_id].present?
      @tours = RestType.find(params[:rest_type_id]).try(:tours)
      render :index
    else
      render status: 404
    end
  end

  def show
    @tour = Tour.find(params[:id])
    @manager = @tour.first_manager
    @contacts = @manager.contacts
    @countries = @tour.countries
    @price = @tour.price if @tour.present?
    @special_price = @tour.special_price
    @dates_of = @tour.dates_of
    @special_dates_of = @tour.special_dates_of
    @attaches = @tour.attaches
    @all_dates_of = @tour.all_dates_of.pluck(:day_of)
  end
end
