class ToursController < ApplicationController
  def index
    @tours = Tour.all
  end

  def byresttypes
    @tours = RestType.find(params[:rest_type_id]).try(:tours)
    render :index
  end

  def show
    @tour = Tour.find(params[:id])
  end
end
