class VisasController < ApplicationController
  def index
    @visas = Visa.all
  end

  def show
    @visa = Visa.friendly.find(params[:id])
  end
end
