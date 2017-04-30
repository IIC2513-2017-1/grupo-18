json.extract! user, :id, :username, :email, :encrypted_password, :confirmation_token, :confirmed_at, :type, :created_at, :updated_at
json.url user_url(user, format: :json)
