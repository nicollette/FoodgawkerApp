FoodgawkerApp.Views.MostFaved = FoodgawkerApp.Views.RecipesBase.extend({
  template: JST["recipes/most_faved"],
  
  initialize: function () {
    FoodgawkerApp.Views.RecipesBase.prototype.initialize.call(this);
    this.listenForScroll();
  }
})