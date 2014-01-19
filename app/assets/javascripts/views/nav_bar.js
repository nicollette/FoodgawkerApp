FoodgawkerApp.Views.NavBar = Backbone.View.extend({
  template: JST["nav_bar"],
  
  render: function () {
    var content = this.template();
    this.$el.html(content);
    
    return this;
  }
})