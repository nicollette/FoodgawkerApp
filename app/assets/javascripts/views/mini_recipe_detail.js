FoodgawkerApp.Views.MiniRecipeDetail = Backbone.View.extend({
  template: JST["recipes/mini_detail"],
  
  initialize: function () {
    this.listenTo(this.model, "all", this.render);
    this.listenTo(this.model.get("favorites"), "all", this.render);
    // $('button#share').tooltip({
    //   placement: "right",
    //   title: "Email Recipe",
    //   trigger: "hover"
    // })
  },

  events: {
    "click button#favorite": "favorite",
    "click button#unfavorite": "unfavorite",
    "click div.hover-header": "toggleModal", 
    "mouseenter img.detail": "showTitle", 
    "click button#share": "emailRecipe"
  },
  
  render: function () {
    var content = this.template({ recipe: this.model });
    this.$el.html(content);
    return this;
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
        view.$("#email-text").css("display", "inline-block").fadeOut(2000);
      }
    })
  },
  
  showTitle: function (event) {    
    var view = this;

    var recipeId = $(event.target).attr("data-recipe-id");
    _.throttle(function() {
      $("#img" + recipeId).off('mouseenter');
      $("#header" + recipeId).show()
      $("#overlay-img" + recipeId).show()

       $("#header" + recipeId).mouseleave(function () {
          $("#header" + recipeId).hide();
          $("#overlay-img" + recipeId).hide()
          $("#img" + recipeId).on("mouseenter", view.showTitle.bind(view));
        }) 
    }, 0)()
  },
  
  toggleModal: function (event) {
    console.log("clicked img!")
    var recipeId = $(event.target).attr("data-recipe-id")
    $("#recipeModal" + recipeId).modal("toggle");
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
})