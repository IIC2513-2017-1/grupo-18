module AvatarsHelper
include SessionsHelper

  def current_user_thumb
  	current_user.image.thumb.url || default_thumb
  end

  def this_user_thumb
  	@user.image.thumb.url || default_thumb
  end

  def default_thumb
  	# image = MiniMagick::Image.open("https://cdn.pixabay.com/photo/2017/04/15/04/36/incognito-2231825_960_720.png")
  	# image.resize "150x150"
	# image.format "png"
	# image.write "public/default_thumb.png"
	"/default_thumb.png"
  end
end
