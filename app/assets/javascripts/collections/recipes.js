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
        recipeResults.reset(response)
        callback(recipeResults);
      }
    })
  }
})