FoodgawkerApp.Collections.Recipes = Backbone.Collection.extend({
  url: "/api/recipes",
  
  model: FoodgawkerApp.Models.Recipe,
  
  comparator: function (recipe) {
    return -recipe.id
  },
  
  fetchByQuery: function (querystring, callback) {
    var recipeResults = this;
    $.ajax({
      type: 'GET',
      url: '/api/search',
      data: querystring,
      success: function (response) {
        recipeResults.reset(recipeResults.parseResults(response))
        callback(recipeResults);
      }
    })
  },
    
  parseResults: function (response) {
    var recipes = [];
    response.forEach(function(recipe) {
      var newRecipe = new FoodgawkerApp.Models.Recipe(recipe);
      var favs = new FoodgawkerApp.Collections.Favorites(recipe.favorites)
      newRecipe.set("favorites", favs);
      recipes.push(newRecipe);
    });
    
    return recipes;
  },
  
  parse: function (response) {
    this.page_number = parseInt(response.page_number);
    this.total_pages = parseInt(response.total_pages);
    return response.models;
  }
})