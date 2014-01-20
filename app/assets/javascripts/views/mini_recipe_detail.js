FoodgawkerApp.Views.MiniRecipeDetail = Backbone.View.extend({
  template: JST["recipes/mini_detail"],
  
  initialize: function () {
    this.listenTo(this.model, "all", this.render);
    this.listenTo(this.model.get("favorites"), "all", this.render);
  },

  events: {
    "click button#favorite": "favorite",
    "click button#unfavorite": "unfavorite",
    "click img": "toggleModal"
  },
  
  render: function () {
    var content = this.template({ recipe: this.model });
    this.$el.html(content);
    
    return this;
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
        alert("faved!")
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
          // alert("unfaved");
          recipe.get("favorites").remove(fav)
        }
      });
    }, 1000);

  }
})