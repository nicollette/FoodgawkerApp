window.FoodgawkerApp = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  Data: {},
  initialize: function() {
    FoodgawkerApp.Data.categories =      
      JSON.parse($("#bootstrapped-categories").html());
    // Do i not need to JSON.parse the bootstrapped data?
    // I get an error on load
    var currUser = JSON.parse($("#bootstrapped-current-user").html().trim());
    FoodgawkerApp.Data.currentUser = new FoodgawkerApp.Models.User();
    if(typeof currUser === "object") {
      FoodgawkerApp.Data.currentUser.set(currUser);
      FoodgawkerApp.Data.session = new FoodgawkerApp.Models.Session({ id: 1 });
      
      this.flash(
        ["Welcome " + FoodgawkerApp.Data.currentUser.get("username")], 
        "success"
      )
    }
    
    var navView = new FoodgawkerApp.Views.NavBar();
    $("#nav-section").html(navView.render().$el);
    
    FoodgawkerApp.Data.recipes = new FoodgawkerApp.Collections.Recipes();
    FoodgawkerApp.Data.recipes.fetch({
      data: { page: 1 },
      success: function () {
        new FoodgawkerApp.Routers.RecipeRouter({ 
          recipes: FoodgawkerApp.Data.recipes,
          $rootEl: $(".container")
        });
        Backbone.history.start();
      }
    })
  },
  
  flash: function (messages, type) {
    this.emptyFlash();
    var alertClasses = "alert alert-" + type;
    
    messages.forEach(function (message) {
      var $newAlert = $("<div>").addClass(alertClasses);
      $newAlert.text(message);
      
      $("#alerts-section").append($newAlert)
    })
    $("#alerts-section").fadeOut(5500, this.emptyFlash.bind(this));
  },
  
  emptyFlash: function () {
    $("#alerts-section").empty();
  }
};

$(document).ready(function(){
  FoodgawkerApp.initialize();
});
