json.partial! "users/user", user: @user
json.public_bets @user.bets.where(visible: true ) do |bet|
  json.name bet.name if bet.name.present?
  json.name bet_path(bet) unless bet.name.present?
end
if !different_user?
  json.private_bets @user.bets.where(visible: false) do |bet|
    json.name bet.name if bet.name.present?
    json.name bet_path(bet) unless bet.name.present?
  end
else
  if are_we_both_friends?(current_user, @user)
    json.friendship_status 'Somos amigos'
    json.private_bets Bet.where(user: @user, visible: false) do |bet|
      json.name bet.name if bet.name.present?
      json.name bet_path(bet) unless bet.name.present?
    end
  elsif only_I_am_friend?(current_user, @user)
    json.friendship_status 'Aun no aceptan tu solicitud de amistad'
  elsif only_he_is_friend?(current_user, @user)
    json.friendship_status 'Aun no aceptas la solicitud de amistad'
  else
    json.friendship_status 'No son amigos'
  end
end
