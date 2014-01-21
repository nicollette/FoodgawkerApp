json.page_number(@page_num)
json.total_pages(@recipes.total_pages)

json.models @recipes do |recipe|
  json.(recipe, :id, :title, :blog_url, :description, :total_time, :user_id, :created_at)
  json.username(recipe.user.username)
  json.med_photo_url(recipe.photo.url(:medium))
  json.large_photo_url(recipe.photo.url(:large))
  json.categories(recipe.categories, :id, :name)
  json.favorites(recipe.favorites, :id, :recipe_id, :user_id)
end