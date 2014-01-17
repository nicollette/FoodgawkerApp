FoodgawkerApp.Views.Search = Backbone.View.extend({
  template: JST["recipes/search"],
  
  events: {
    "click button": "search"
  },
  
  render: function () {
    var content = this.template();
    this.$el.html(content);
    
    return this;out
  },
  
  search: function (event) {
    event.preventDefault();
    debugger;
    var queryString = $(event.target.form).serialize();
    var searchResults = new FoodgawkerApp.Collections.Recipes();
    searchResults.fetchByQuery(queryString);
  }
})