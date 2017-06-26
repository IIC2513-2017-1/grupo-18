class SessionsController < ApplicationController
  skip_before_action :check_logged_in, only: [:new, :create]


  def new
    redirect_to home_path, notice: 'Ud ya esta logueado :D.' if current_user.present?
  end

  def create
  	# Auth
    respond_to do |format|
      format.html {
        email = params[:session][:email].downcase
      	password = params[:session][:password]

      	user = User.find_by(email: email)

      	if(!user)
      		# Couldn't find that user
      		flash.now[:danger] = "User doesn't exist"
      		render 'new'
        elsif(!(user.user_type > 0) && !user.activated)
          flash.now[:danger] = "User isn't activated"
          render 'new'
      	elsif(!user.authenticate(password))
      		# Auth failed.
      		flash.now[:danger] = 'Authentication failed'
      		render 'new'
      	else
          log_in user
          redirect_to user
        end
      }
      format.json {
        email = params[:email].downcase
        password = params[:password]
        user = User.find_by(email: email)
        return render json: { error: 'Usuario no encontrado' }, status: 404 unless user.present?
        return render json: { error: 'Usuario no activo' }, status: 401 unless user.user_type > 0 || user.activated
        return render json: { error: 'Password incorrecta' }, status: 401 unless user.authenticate(password)
        render json: {message: 'Usuario autenticado', access_token: user.generate_access_token}

      }

    end

  end

  def destroy
  	log_out
  	redirect_to root_url
  end

end
