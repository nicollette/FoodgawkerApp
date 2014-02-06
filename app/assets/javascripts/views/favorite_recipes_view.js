FoodgawkerApp.Views.FavoriteRecipesView =       
  FoodgawkerApp.Views.RecipesBase.extend({
  
  template: JST["recipes/favorite_recipes"],
  
  initialize: function () {
    FoodgawkerApp.Views.RecipesBase.prototype.initialize.call(this);
  }
});