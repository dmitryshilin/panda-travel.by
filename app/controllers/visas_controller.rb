class VisasController < ApplicationController
  def index
    @visas = Visa.all
  end

  def for
    tour = Tour.find(params[:tour_id])
    if tour.present?
      @visas = tour.visas
      render :index
    else
      render status: 404
    end
  end

  def show
    @visa = Visa.find(params[:id])
  end
end
