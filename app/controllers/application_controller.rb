class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticity_token, if: -> { request.format.json? }
  # protect_from_forgery unless: -> { request.format.json? }
  include SessionsHelper

  before_action :set_locale, :check_logged_in

  def set_locale
    I18n.locale = 'es'
  end

  private

	  def check_logged_in
    	unless logged_in?
        puts("Not logged in!")
	  		flash[:error] = "You must be logged in to access this page"
    		redirect_to login_url
	  	end
	  end
end
