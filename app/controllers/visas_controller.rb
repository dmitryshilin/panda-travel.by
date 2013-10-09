class VisasController < ApplicationController
  def index
    if params[:tour_id].present?
      # raise Tour.find(params[:tour_id]).id.to_s
      @visas = Visa.joins(:tours).where('tour_id = ?', Tour.find(params[:tour_id]).id)
    else
      @visas = Visa.all
    end
  end

  def show
    @visa = Visa.find(params[:id])
  end
end
