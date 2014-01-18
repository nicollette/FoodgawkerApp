FoodgawkerApp.Routers.RecipeRouter = Backbone.Router.extend({
  routes: {
    "": "index",
    "recipes": "index",
    "recipes/new": "new",
    "recipes/:id": "detail",
    "search": "search",
    "favorites": "favorites"
  },
  
  initialize: function (options) {
    this.recipes = options.recipes;
    this.$rootEl = options.$rootEl
  },
  
  index: function () {
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
  
  detail: function (id) {
    var recipe = FoodgawkerApp.Data.recipes.get(id);
    var view = new FoodgawkerApp.Views.RecipeDetail({
      model: recipe
    });
    this._swapView(view);
  },
  
  favorites: function () {
    // create a favoriteRecipes Collection? (model: recipe)
    // does this need a custom controller to fetch the fav recipes for the current user?
    // this controller needs a before filter to authenticate user, or is this done in Backbone?
      // if done on the Backbone side, how do i redirect a backbone view to a Rails template?
  // create a fav's router with current users' favorites?  
  },
  
  search: function () {
    var view = new FoodgawkerApp.Views.Search();
    this._swapView(view);
  },
  
  _swapView: function (view) {
    if(this.current_view && this.current_view.removeAll) { 
      this.current_view.removeAll();
    } else {
      this.current_view && this.current_view.remove();
    }
    
    this.current_view = view
    this.$rootEl.html(view.render().$el);
  }
})