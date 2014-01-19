FoodgawkerApp.Views.FavoriteRecipesView = Backbone.View.extend({
  template: JST["recipes/favorite_recipes"],

  initialize: function () {
    this.listenTo(this.collection, "all", this.render)  
  },
   
  childViews: [],
  
  render: function () {
    var favoritesView = this;
    var content = this.template({ recipes: this.collection });
    this.$el.html(content);
    this.collection.each(function (recipe) {
      var miniDetailView = new FoodgawkerApp.Views.MiniRecipeDetail({ 
        model: recipe 
      });
      favoritesView.childViews.push(miniDetailView);
      favoritesView.$el.append(miniDetailView.render().$el);
    })
    
    return this;
  },
  
  removeAll: function () {
    this.childViews.forEach(function(childView) {
      childView.remove();
    })
    this.remove();
  }
})