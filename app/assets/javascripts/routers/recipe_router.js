FoodgawkerApp.Routers.RecipeRouter = Backbone.Router.extend({
  routes: {
    "": "index",
    "users/new": "signUp",
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
  
  signUp: function () {
    if(FoodgawkerApp.Data.currentUser.length > 0) {
      Backbone.history.navigate("", { trigger: true })
    } else {
      var newUser = new FoodgawkerApp.Models.User();
      var view = new FoodgawkerApp.Views.SignUp({
        model: newUser
      });
      
      this._swapView(view);
    }
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
    var router = this;
    var favRecipes = new FoodgawkerApp.Collections.FavoriteRecipes();
    favRecipes.fetch({
      success: function () {
        var view = new FoodgawkerApp.Views.FavoriteRecipesView({ 
          collection: favRecipes 
        });
        router._swapView(view)
      }
    });
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