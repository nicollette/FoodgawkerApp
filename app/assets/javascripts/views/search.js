FoodgawkerApp.Views.Search = Backbone.View.extend({
  template: JST["recipes/search"],
  
  events: {
    "click button": "search"
  },
  
  childViews: [],
  
  render: function () {
    var content = this.template();
    this.$el.html(content);
    
    return this;
  },
  
  renderResults: function (results) {
    var resultsView = new FoodgawkerApp.Views.Results({ collection: results });
    this.$("#results").html(resultsView.render().$el)
    
    this.childViews.push(resultsView)
    this.childViews.concat(resultsView.childViews);
  },
  
  search: function (event) {
    event.preventDefault();
    var queryString = $(event.target.form).serialize();
    var searchResults = new FoodgawkerApp.Collections.Recipes();
    var searchView = this;
    
    searchResults.fetchByQuery(queryString, function (results) {
      searchView.renderResults(results);
    });
  },
  
  removeAll: function () {
    this.childViews.forEach(function(childView) {
      childView.remove();
    })
    this.remove();
  }
})