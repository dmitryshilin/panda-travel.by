class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # check_authorization
  protect_from_forgery with: :exception
  before_action :constant
  before_action :store_history

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
    @best_country = Country.order('rating DESC').first
    @last_news = News.last_news(3)
    @random_tours = Tour.get_random(3)
    @last_tours = Tour.published.last(3)
    @articles = Article.last(10)
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

  private

  def store_history
    session[:history] ||= []
    session[:history].delete_at(0) if session[:history].size >= 5
    session[:history] << request.fullpath if request.fullpath =~ /^\/tours\/\d+$/
  end
end
