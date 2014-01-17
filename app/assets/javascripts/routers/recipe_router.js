FoodgawkerApp.Routers.RecipeRouter = Backbone.Router.extend({
  routes: {
    "": "index",
    "recipes": "index",
    "recipes/new": "new",
    "recipes/:id": "detail"
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
  
  _swapView: function (view) {
    // will need to change remove to remove nested views
    if(this.current_view && this.current_view.removeAll) { 
      this.current_view.removeAll()
    } else {
      this.current_view && this.current_view.remove()
    }
    
    this.current_view = view
    this.$rootEl.html(view.render().$el);
  }
})