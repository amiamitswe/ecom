json.data do
  json.categories do
    json.array! @categories do |category|
      json.id category.id
      json.name category.name
      json.status category.status
      json.create category.created_at
      json.update category.updated_at

      # json.all category

      #
      # json.assigned_user do
      #   json.id @task.assigned_user.id
      #   json.name @task.assigned_user.name
      # end
    end
  end
end