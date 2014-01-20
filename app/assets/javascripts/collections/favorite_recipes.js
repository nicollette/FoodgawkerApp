FoodgawkerApp.Collections.FavoriteRecipes = Backbone.Collection.extend({
  model: FoodgawkerApp.Models.Recipe,
  url: "/api/favorite_recipes",
  
  parse: function (response) {
    this.page_number = parseInt(response.page_number);
    this.total_pages = parseInt(response.total_pages);
    return response.models;
  }
})