class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  layout :choose_layout

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

end
