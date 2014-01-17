FoodgawkerApp.Views.Search = Backbone.View.extend({
  template: JST["recipes/search"],
  
  render: function () {
    var content = this.template();
    this.$el.html(content);
    
    return this;
  }
})