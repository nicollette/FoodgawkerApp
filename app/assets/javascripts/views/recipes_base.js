FoodgawkerApp.Views.RecipesBase = Backbone.View.extend({  
  initialize: function () {
    this.childViews = [];
    this.listenTo(this.collection, "add remove reset change", this.render);
    this.listenTo(FoodgawkerApp.Data.currentUser, "all", this.render);
  },
  
  render: function () {
    var indexView = this;
    var content = this.template({ recipes: this.collection });
    this.$el.html(content);
    
    this.collection.each(function (recipe) {
      var miniDetailView = new FoodgawkerApp.Views.MiniRecipeDetail({ 
        model: recipe 
      });
      
      indexView.childViews.push(miniDetailView);
      indexView.$el.append(miniDetailView.render().$el);
    })
    return this;
  },
  
  listenForScroll: function () {
    $(window).off("scroll");
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
});