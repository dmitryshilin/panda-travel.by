class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # check_authorization
  protect_from_forgery with: :exception
  before_action :constant

  layout :choose_layout

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to '/', alert: exception.message
  end

  def constant
    @europe = Country.europe
    @asia = Country.asia
    @africa = Country.africa
    @america = Country.america
    @also = Country.also
    @resttypes ||= RestType.all
    #@first_three_news = News.order('updated_at DESC').first(3)
    @best_country = Country.order('rating DESC').first
    @last_news = News.last_news(3)
    @random_tours = Tour.get_random(3)
    @last_tours = Tour.published.last(3)
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

  def current_ability
    @current_ability ||= Ability.new(current_admin_user)
  end
end
