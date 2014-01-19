FoodgawkerApp.Views.MiniRecipeDetail = Backbone.View.extend({
  template: JST["recipes/mini_detail"],
  
  initialize: function () {
    this.listenTo(this.model, "all", this.render);
    this.listenTo(this.model.get("favorites"), "all", this.render);
  },
  
  events: {
    "click button#favorite": "favorite",
    "click button#unfavorite": "unfavorite"
  },
  
  render: function () {
    var content = this.template({ recipe: this.model });
    this.$el.html(content);
    return this;
  },
  
  favorite: function (event) {
    // if no user is logged in then display sign in page when fav button is clicked
    event.preventDefault();
    var recipe = this.model;
    
    var recipe_id = $(event.target).attr("data-recipe-id");
    
    var fav = new FoodgawkerApp.Models.Favorite();
    fav.save( { recipe_id: recipe_id },{
      success: function () {
        alert("faved!")
        // recipe.set("favorites", fav)
        recipe.get("favorites").add(fav)
      }      
    }); 
  },
  
  unfavorite: function () {
    event.preventDefault();
    
    var recipe = this.model;
    var fav = this.model.get("favorites").findWhere({ 
      user_id: FoodgawkerApp.Data.currentUser.id
    });

    fav.destroy({
      success: function () {
        alert("unfaved")
        // recipe.set("favorites", [])
        recipe.get("favorites").remove(fav)
      }
    });
  }
})