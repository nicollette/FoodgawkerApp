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
    
    var recipeCounter = 0;
    var rowId = 2;
    this.collection.each(function (recipe) {
      var miniDetailView = new FoodgawkerApp.Views.MiniRecipeDetail({ 
        model: recipe 
      });
      
      if(recipeCounter % 3 === 0) {
        if(recipeCounter > rowId) {
          rowId += 3;
        }
        indexView.appendRow(rowId)        
      }
      indexView.childViews.push(miniDetailView);
      indexView.$("#" + rowId).append(miniDetailView.render().$el);
      recipeCounter++;
    })
    
    return this;
  },
  
  appendRow: function (id) {
    var newRow = $("<div class='row' id='" + id + "'>")
    this.$el.append(newRow)
  },
  
  removeAll: function () {
    this.childViews.forEach(function(childView) {
      childView.remove();
    })
    this.remove();
  }
})