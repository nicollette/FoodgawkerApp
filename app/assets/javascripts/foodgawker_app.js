window.FoodgawkerApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Data: {},
  initialize: function() {
    FoodgawkerApp.Data.categories =      
      JSON.parse($("#bootstrapped-categories").html());
    FoodgawkerApp.Data.recipes = new FoodgawkerApp.Collections.Recipes();
    FoodgawkerApp.Data.recipes.fetch({
      success: function () {
        new FoodgawkerApp.Routers.RecipeRouter({ 
          recipes: FoodgawkerApp.Data.recipes,
          $rootEl: $("#content")
        });
        Backbone.history.start();
      }
    })
  }
};

$(document).ready(function(){
  FoodgawkerApp.initialize();
});
