FoodgawkerApp.Views.MostFaved = Backbone.View.extend({
  template: JST["recipes/most_faved"],
  
  childViews: [],
  
  initialize: function () {
    this.listenTo(this.collection, "add remove reset change", this.render);
    this.listenTo(FoodgawkerApp.Data.currentUser, "all", this.render);
  },
  
  render: function () {    
    var mostFavedView = this;
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
        mostFavedView.appendRow(rowId)        
      }
      mostFavedView.childViews.push(miniDetailView);
      mostFavedView.$("#" + rowId).append(miniDetailView.render().$el);
      recipeCounter++;
    })
    this.listenForScroll();
    return this;
  },
  
  appendRow: function (id) {
    var newRow = $("<div class='row index' id='" + id + "'>")
    this.$el.append(newRow)
  },
  
  listenForScroll: function () {
    $(window).off("scroll"); // remove past view's listeners
    var throttledCallback = _.throttle(this.nextPage.bind(this), 200);
    $(window).on("scroll", throttledCallback);
  },

  nextPage: function () {
    var indexView = this;
    if ($(window).scrollTop() > $(document).height() - $(window).height() - 400){
      console.log("scrolled to bottom!");
      if (indexView.collection.page_number < indexView.collection.total_pages) {
        indexView.collection.fetch({
          data: { page: indexView.collection.page_number + 1 },
          remove: false,
          wait: true,
          success: function () {
            console.log("successfully fetched page " + indexView.collection.page_number);
          }
        });
      }
    }
  },
      
  removeAll: function () {
    this.childViews.forEach(function(childView) {
      childView.remove();
    })
    this.remove();
  }
})