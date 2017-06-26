if !different_user? || admin_access?
  json.extract! user, :id, :username, :email, :balance
else
  json.extract! user, :id, :username, :email
end
