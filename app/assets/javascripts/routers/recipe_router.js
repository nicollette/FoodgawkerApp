FoodgawkerApp.Routers.RecipeRouter = Backbone.Router.extend({
  routes: {
    "": "index",
    "recipes": "index"
  },
  
  initialize: function (options) {
    this.recipes = options.recipes;
    this.$rootEl = options.$rootEl
  },
  
  index: function () {
    var view = new FoodgawkerApp.Views.RecipesIndex({ collection: this.recipes })
    this._swapView(view);
  },
  
  _swapView: function (view) {
    // will need to change remove to remove nested views
    this.current_view && this.current_view.remove()
    this.current_view = view
    this.$rootEl.html(view.render().$el);
  }
})