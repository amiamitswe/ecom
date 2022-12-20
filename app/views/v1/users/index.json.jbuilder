json.data do
  json.users do
    json.array! @users do |user|
      json.id user.id
      json.username user.username
      json.email user.email
      json.role user.role
      json.created_at user.created_at
    end
  end
  json.status 'OK'
  json.status_code 302
  json.user_count @users.count
end
