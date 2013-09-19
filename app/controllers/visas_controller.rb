class VisasController < ApplicationController
  def index
    @visas = Visa.all
  end

  def show
    @visa = Visa.find(params[:id])
  end
end
