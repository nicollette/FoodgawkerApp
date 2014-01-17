FoodgawkerApp.Collections.Recipes = Backbone.Collection.extend({
  url: "/api/recipes",
  
  model: FoodgawkerApp.Models.Recipe,
  
  fetchByQuery: function (querystring) {
    $.ajax({
      type: 'GET',
      url: '/api/search',
      data: querystring,
      success: function (response) {
        // redirect to results view
        
        Backbone.history.navigate("search/results", { trigger: true })
      }
    })
  }
})