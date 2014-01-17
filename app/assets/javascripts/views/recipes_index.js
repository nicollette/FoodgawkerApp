FoodgawkerApp.Views.RecipesIndex = Backbone.View.extend({
  template: JST["recipes/index"],
  
  childViews: [],
  
  initialize: function () {
    this.listenTo(this.collection, "all", this.render)
  },
  
  render: function () {
    var indexView = this;
    var content = this.template({ recipes: this.collection });
    this.$el.html(content);
    this.collection.each(function (recipe) {
      var miniDetailView = new FoodgawkerApp.Views.MiniRecipeDetail({ 
        model: recipe 
      });
      
      indexView.childViews.push(miniDetailView);
      indexView.$el.append(miniDetailView.render().$el);
    })
    
    return this;
  },
  
  remove: function () {
    if(this.childViews.length > 0) {
      this.childViews.forEach(function(childView) {
        childView.remove();
      })
    }
    this.remove();
  }
})