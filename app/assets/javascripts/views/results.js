FoodgawkerApp.Views.Results = Backbone.View.extend({
  template: JST["recipes/results"],
  
  childViews: [],
  
  initialize: function () {
    this.listenTo(this.collection, "add remove reset change", this.render);
    this.listenTo(FoodgawkerApp.Data.currentUser, "all", this.render);
  },
  
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
    // this.listenForScroll();
    return this;
  },
  
  // listenForScroll: function () {
 //    $(window).off("scroll"); // remove past view's listeners
 //    var throttledCallback = _.throttle(this.nextPage.bind(this), 200);
 //    $(window).on("scroll", throttledCallback);
 //  },
 // 
 //  nextPage: function () {
 //    var indexView = this;
 //    if ($(window).scrollTop() > $(document).height() - $(window).height() - 50){
 //      console.log("scrolled to bottom!");
 //      if (indexView.collection.page_number < indexView.collection.total_pages) {
 //        indexView.collection.fetch({
 //          data: { page: indexView.collection.page_number + 1 },
 //          remove: false,
 //          wait: true,
 //          success: function () {
 //            console.log("successfully fetched page " + indexView.collection.page_number);
 //          }
 //        });
 //      }
 //    }
 //  },
  
  removeAll: function () {
    this.childViews.forEach(function(childView) {
      childView.remove();
    })
    this.remove();
  }
})