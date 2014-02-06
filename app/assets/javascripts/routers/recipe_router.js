FoodgawkerApp.Routers.RecipeRouter = Backbone.Router.extend({
  routes: {
    "": "index",
    "users/new": "signUp",
    "session/new": "signIn",
    "recipes": "index",
    "recipes/new": "new",
    "recipes/:id": "detail",
    "top": "mostFaved",
    "search": "search",
    "favorites": "favorites"
  },
  
  initialize: function (options) {
    this.recipes = options.recipes;
    this.$rootEl = options.$rootEl
  },
  
  mostFaved: function () {
    var router = this;
    var topRecipes = new FoodgawkerApp.Collections.MostFaved();
    topRecipes.fetch({
      data: { page: 1 },
      success: function () {
        var view = new FoodgawkerApp.Views.MostFaved({
          collection: topRecipes
        });
        router._swapView(view);
      }
    })
  },
  
  signUp: function () {
    if(this._isSignedIn()) {
      Backbone.history.navigate("", { trigger: true })
    } else {      
        var newUser = new FoodgawkerApp.Models.User();
        var view = new FoodgawkerApp.Views.SignUp({
          model: newUser
        });
        this._swapView(view);
    }
  },
  
  signIn: function () {
    if(this._isSignedIn()) {
      Backbone.history.navigate("", { trigger: true })
    } else {
        var newSession = new FoodgawkerApp.Models.Session();
        var view = new FoodgawkerApp.Views.SignIn({
          model: newSession
        });
      
        this._swapView(view);
    }    
  },
  
  index: function () {
    FoodgawkerApp.Data.recipes.sort();
    var view = new FoodgawkerApp.Views.RecipesIndex({ 
      collection: FoodgawkerApp.Data.recipes 
    });
    
    this._swapView(view);      
  
  },
  
  new: function () {
    if(this._isSignedIn()) {
      var newRecipe = new FoodgawkerApp.Models.Recipe();
      var view = new FoodgawkerApp.Views.RecipeForm({ 
        collection: FoodgawkerApp.Data.recipes,
        model: newRecipe 
      });
      this._swapView(view);  
    }
    else {
      Backbone.history.navigate("session/new", { trigger: true })
    }
  },
  
  detail: function (id) {
    var router = this;
    var recipe = new FoodgawkerApp.Models.Recipe({id: id})
    recipe.fetch({
      success: function () {
        var view = new FoodgawkerApp.Views.RecipeDetail({
          model: recipe
        });
        router._swapView(view);
      }
    })

  },
  
  favorites: function () {
    var router = this;
    var favRecipes = new FoodgawkerApp.Collections.FavoriteRecipes();
    favRecipes.fetch({
      data: { page: 1 },
      success: function () {
        var view = new FoodgawkerApp.Views.FavoriteRecipesView({ 
          collection: favRecipes 
        });
        router._swapView(view)
      }
    })
  },
  
  search: function () {
    var view = new FoodgawkerApp.Views.Search();
    this._swapView(view);
  },
  
  _isSignedIn: function () {
    return (FoodgawkerApp.Data.currentUser.id);
  },
  
  _clearAlerts: function () {
    $("#alerts-section").empty();
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