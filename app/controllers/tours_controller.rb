class ToursController < ApplicationController
  def index
    @tours = Tour.published
  end

  def byresttypes
    # raise params[:rest_type_id].to_s
    @tours = RestType.find(params[:rest_type_id]).try(:tours)
    render :index
  end

  def show
    @tour = Tour.find(params[:id])
  end
end
