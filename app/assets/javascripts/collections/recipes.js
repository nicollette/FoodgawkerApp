FoodgawkerApp.Collections.Recipes = Backbone.Collection.extend({
  url: "/api/recipes",
  model: FoodgawkerApp.Models.Recipe
})