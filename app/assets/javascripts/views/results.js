FoodgawkerApp.Views.Results = Backbone.View.extend({
  template: JST["recipes/results"],
  
  childViews: [],
  
  render: function () {
    var resultsView = this;
    var content = this.template({ recipes: this.collection });
    
    this.$el.html(content);
    this.collection.each(function (recipe) {
      var miniDetailView = new FoodgawkerApp.Views.MiniRecipeDetail({ 
        model: recipe 
      });
      
      resultsView.childViews.push(miniDetailView);
      resultsView.$el.append(miniDetailView.render().$el);
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