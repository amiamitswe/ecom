json.data do
  json.user do
    if @user.id.present?
      json.(@user, :id, :username, :email, :phone, :role, :updated_at, :created_at)
    end
  end

  json.error @user.errors
  if @user.id.present?
    json.status 'OK'
    json.status_code 201
  else
    json.status 'FAILED'
    json.status_code 302
  end
end

