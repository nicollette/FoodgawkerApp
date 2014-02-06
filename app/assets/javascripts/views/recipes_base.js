FoodgawkerApp.Views.RecipesBase = Backbone.View.extend({  
  initialize: function () {
    this.childViews = [];
    this.listenTo(this.collection, "add remove reset change", this.render);
    this.listenTo(FoodgawkerApp.Data.currentUser, "all", this.render);
  },
  
  render: function () {
    var view = this;
    var content = this.template({ recipes: this.collection });
    this.$el.html(content);
    
    this.collection.each(function (recipe) {
      var miniDetailView = new FoodgawkerApp.Views.MiniRecipeDetail({ 
        model: recipe 
      });
      
      view.childViews.push(miniDetailView);
      view.$el.append(miniDetailView.render().$el);
    })
    return this;
  },
  
  listenForScroll: function () {
    $(window).off("scroll");
    var throttledCallback = _.throttle(this.nextPage.bind(this), 200);
    $(window).on("scroll", throttledCallback);
  },

  nextPage: function () {
    var view = this;
    if ($(window).scrollTop() > $(document).height() - $(window).height() - 400){
      console.log("scrolled to bottom!");
      if (view.collection.page_number < view.collection.total_pages) {
        view.collection.fetch({
          data: { page: view.collection.page_number + 1 },
          remove: false,
          wait: true,
          success: function () {
            console.log("successfully fetched page " + view.collection.page_number);
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