class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :constant

  def constant
    @europe = Country.where('region = ?', 'Европа')
    @asia = Country.where('region = ?', 'Азия')
    @africa = Country.where('region = ?', 'Африка')
    @america = Country.where('region = ?', 'Южная Америка')
    @also = Country.where('region = ?', 'А также')
  end
end
