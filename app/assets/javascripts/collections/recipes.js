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
        // do i need to parse response or can i update my collection with it?
        // i want to create a results view with the response
        Backbone.history.navigate("search/results", { trigger: true })
      }
    })
  }
})