json.(@user, :id, :username, :email)
json.favorite_recipes(@user.favorite_recipes, :id, :title, :blog_url, :description, :total_time, :user_id)
json.errors(@user.errors.full_messages)