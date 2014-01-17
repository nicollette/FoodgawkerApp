json.array! @recipes do |recipe|
  json.(recipe, :id, :title, :blog_url, :description, :total_time, :user_id)
  json.username(recipe.user.username)
  json.photo_url(recipe.photo.url(:large))
  json.categories(recipe.categories, :id, :name)
  json.favorites(recipe.favorites, :id, :recipe_id, :user_id)
end