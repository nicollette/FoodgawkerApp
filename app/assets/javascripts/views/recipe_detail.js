FoodgawkerApp.Views.RecipeDetail = Backbone.View.extend({
  template: JST["recipes/show"],
  
  events: {
    "click button#favorite": "favorite"
  },
  
  initialize: function () {
    this.listenTo(this.model, "all", this.render)
  },
  
  render: function () {
    var content = this.template({ recipe: this.model });
    this.$el.html(content);
    
    return this;
  },
  
  favorite: function (event) {
    event.preventDefault();
    
    var recipe_id = $(event.target).attr("data-recipe-id");
    
  }
})