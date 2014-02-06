FoodgawkerApp.Views.RecipesIndex = FoodgawkerApp.Views.RecipesBase.extend({
  template: JST["recipes/index"],
  
  initialize: function () {
    FoodgawkerApp.Views.RecipesBase.prototype.initialize.call(this);
    this.listenForScroll();
  }
});