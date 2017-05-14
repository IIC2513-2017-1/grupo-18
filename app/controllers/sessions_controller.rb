class SessionsController < ApplicationController
  skip_before_action :check_logged_in, only: [:new, :create]


  def new
  end

  def create
  	# Auth
  	email = params[:session][:email].downcase
  	password = params[:session][:password]

  	user = User.find_by(email: email)

  	if(!user)
  		# Couldn't find that user
  		flash.now[:danger] = "User doesn't exist"
  		render 'new'
  	elsif(!user.authenticate(password))
  		# Auth failed.
  		flash.now[:danger] = 'Authentication failed'
  		render 'new'
  	else

  	# If we're here, then Auth succeeded.

	  	log_in user
	  	redirect_to user

	end

  end

  def destroy
  	log_out
  	redirect_to root_url
  end

end
