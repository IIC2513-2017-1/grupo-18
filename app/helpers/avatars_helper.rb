module AvatarsHelper
include SessionsHelper

  ### Main Functions

  # 200x200
  def user_medium user
    if(user.gravatar_usage)
      "#{user.gravatar_url}&s=200"
    else
      user.image.medium.url || default_thumb
    end
  end

  # 150x150
  def user_thumb user
    if(user.gravatar_usage)
      "#{user.gravatar_url}&s=150"
    else
      user.image.thumb.url || default_thumb
    end
  end

  def bet_medium bet
    bet.avatar.medium.url || default_bet
  end

  def default_thumb
	  "/default_thumb.png"
  end

  def default_bet
    "/default_bet.png"
  end

  ### Auxiliary Functions

  def current_user_thumb
    user_thumb current_user
    # current_user.image.thumb.url || default_thumb
  end

  def this_user_thumb
    user_thumb @user
    # @user.image.thumb.url || default_thumb
  end

  def this_user_medium
    user_medium @user
    # @user.image.medium.url || default_thumb
  end
end
