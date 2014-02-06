FoodgawkerApp.Views.Results = FoodgawkerApp.Views.RecipesBase.extend({
  template: JST["recipes/results"],
  
  initialize: function () {
    FoodgawkerApp.Views.RecipesBase.prototype.initialize.call(this);
  }
});