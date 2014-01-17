json.array! @recipes do |recipe|
  json.(recipe, :id, :title, :blog_url, :description, :total_time, :user_id)
  json.photo_url(recipe.photo.url(:large))
  json.categories(recipe.categories, :id, :name)
end