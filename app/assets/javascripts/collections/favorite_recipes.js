FoodgawkerApp.Collections.FavoriteRecipes = Backbone.Collection.extend({
  model: FoodgawkerApp.Models.Recipe,
  url: "/api/favorite_recipes"
})