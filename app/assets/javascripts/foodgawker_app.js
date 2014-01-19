window.FoodgawkerApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Data: {},
  initialize: function() {
    FoodgawkerApp.Data.categories =      
      JSON.parse($("#bootstrapped-categories").html());

    FoodgawkerApp.Data.currentUserId = 
      JSON.parse($("#bootstrapped-current-user-id").html().trim());

    var navView = new FoodgawkerApp.Views.NavBar();
    $("#nav-section").html(navView.render().$el);
    
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
