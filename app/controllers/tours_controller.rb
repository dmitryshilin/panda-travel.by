class ToursController < ApplicationController

  def index
    @tours = Tour.published
  end

  def show
    @tour = Tour.find(params[:id])
    unless @tour.published
      raise 'Restrict'
    end
  end
end
