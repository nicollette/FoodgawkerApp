FoodgawkerApp.Views.RecipesIndex = Backbone.View.extend({
  template: JST["recipes/index"],
  
  initialize: function () {
    this.listenTo(this.collection, "all", this.render)
  },
  
  render: function () {    
    var content = this.template({ recipes: this.collection });
    this.$el.html(content)
    return this;
  }
})