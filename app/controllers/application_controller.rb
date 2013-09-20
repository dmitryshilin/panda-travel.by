class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # check_authorization
  protect_from_forgery with: :exception
  before_action :constant
  layout :choose_layout

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end

  def constant
    @europe = Country.where('region = ?', 'Европа')
    @asia = Country.where('region = ?', 'Азия')
    @africa = Country.where('region = ?', 'Африка')
    @america = Country.where('region = ?', 'Южная Америка')
    @also = Country.where('region = ?', 'А также')
  end

  def choose_layout
    request.xhr? ? false : 'application'
  end

  def modal
    @modal = params[:name]
    @model = params[:model]
    if @model.present?
      @id = params[:id]
      @obj = @model.classify.constantize.find @id
    end
  end

  def get_rest_types
    @resttypes ||= RestType.all
  end
end
