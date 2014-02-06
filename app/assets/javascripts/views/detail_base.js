FoodgawkerApp.Views.DetailBase = Backbone.View.extend({
  initialize: function () {
    this.listenTo(this.model, "all", this.render);
    this.listenTo(this.model.get("favorites"), "all", this.render);
  },

  emailTooltip: function (event) {
    var view = this;
    this.$("#email-tooltip").show();
    $(event.currentTarget).mouseleave(function () {
      view.$("#email-tooltip").hide();
    })
  },

  emailRecipe: function (event) {
    var recipeId = $(event.target).attr("data-recipe-id");
    var view = this;
    $.ajax({
      type: 'GET',
      url: '/api/share',
      data: {
        url: this.model.get("blog_url")
      },
      success: function (response) {
        view.$("#email-tooltip").hide();
        view.$("#email-text").css("display", "inline-block").fadeOut(2000);
      }
    })
  },

  favorite: function (event) {
    event.preventDefault();
    var recipe = this.model;
  
    var recipe_id = $(event.target).attr("data-recipe-id");
  
    var fav = new FoodgawkerApp.Models.Favorite();
    fav.save( { recipe_id: recipe_id },{
      success: function () {
        setTimeout(function () {
          recipe.get("favorites").add(fav)     
        }, 1000);
      }      
    }); 
  },

  unfavorite: function () {
    event.preventDefault();
  
    var recipe = this.model;
    var fav = this.model.get("favorites").findWhere({ 
      user_id: FoodgawkerApp.Data.currentUser.id
    });

    setTimeout(function () {
      fav.destroy({
        success: function () {
          recipe.get("favorites").remove(fav)
        }
      });
    }, 1000);

  }
});