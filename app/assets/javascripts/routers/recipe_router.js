FoodgawkerApp.Routers.RecipeRouter = Backbone.Router.extend({
  routes: {
    "": "index",
    "recipes": "index",
    "recipes/new": "new"
  },
  
  initialize: function (options) {
    this.recipes = options.recipes;
    this.$rootEl = options.$rootEl
  },
  
  index: function () {
    // is it bad to fetch again?
    // var router = this;
    // FoodgawkerApp.Data.recipes.fetch({ 
    //   success: function () {
    //     var view = new FoodgawkerApp.Views.RecipesIndex({ 
    //       collection: FoodgawkerApp.Data.recipes 
    //     });
    //     router._swapView(view);        
    //   }
    // })
    
    var view = new FoodgawkerApp.Views.RecipesIndex({ 
      collection: this.recipes 
    });
    this._swapView(view);        
  
  },
  
  new: function () {
    var newRecipe = new FoodgawkerApp.Models.Recipe();
    var view = new FoodgawkerApp.Views.RecipeForm({ 
      collection: this.recipes, 
      model: newRecipe 
    });
    this._swapView(view);  
  },
  
  _swapView: function (view) {
    // will need to change remove to remove nested views
    this.current_view && this.current_view.remove()
    this.current_view = view
    this.$rootEl.html(view.render().$el);
  }
})