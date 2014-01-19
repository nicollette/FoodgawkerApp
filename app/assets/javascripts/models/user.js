FoodgawkerApp.Models.User = Backbone.Model.extend({
  url: "/users",
  
  parse: function (data) {
    if(data.favorite_recipes && data.favorite_recipes.length > 0) {
      data.favorites_recipes = new FoodgawkerApp.Collections.Recipes(
        data.favorite_recipes
      );
    }
    
    return data;
  }
})