FoodgawkerApp.Collections.Recipes = Backbone.Collection.extend({
  url: "/api/recipes",
  
  model: FoodgawkerApp.Models.Recipe,
  
  fetchByQuery: function (querystring, callback) {
    var recipeResults = this;
    $.ajax({
      type: 'GET',
      url: '/api/search',
      data: querystring,
      success: function (response) {
        debugger;
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
  }
})