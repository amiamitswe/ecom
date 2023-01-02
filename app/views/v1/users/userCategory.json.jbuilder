json.user do
  json.id @user.id
  json.username @user.username
  json.created_at @user.updated_at
  json.status 'OK'
  json.status_code 302
  json.categories_count @user.categories.count
  json.category do
    json.array! @user.categories do |category|
      json.id category.id
      json.name category.name
      json.status category.status
      json.create category.created_at
      json.update category.updated_at
    end
  end
end
