window.FoodgawkerApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Data: {},
  initialize: function() {
    FoodgawkerApp.Data.categories =      
      JSON.parse($("#bootstrapped-categories").html());

    var currUser = JSON.parse($("#bootstrapped-current-user").html().trim());
    if(typeof currUser === "object") {
      FoodgawkerApp.Data.currentUser = new FoodgawkerApp.Models.User(currUser)
      FoodgawkerApp.Data.session = new FoodgawkerApp.Models.Session({ id: 1 });
    }
    
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
