FoodgawkerApp.Collections.MostFaved = Backbone.Collection.extend({
  model: FoodgawkerApp.Models.Recipe,
  url: "api/top_recipes",
  
  comparator: function (recipe) {
    return -recipe.get("favorites").length;
  },
  
  parse: function (response) {
    this.page_number = parseInt(response.page_number);
    this.total_pages = parseInt(response.total_pages);
    return response.models;
  }
})