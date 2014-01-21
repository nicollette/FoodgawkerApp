json.(@recipe, :id, :title, :blog_url, :description, :total_time, :user_id, :created_at)
json.photo_url(@recipe.photo.url(:large))
