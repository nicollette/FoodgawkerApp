FoodgawkerApp.Views.MiniRecipeDetail = Backbone.View.extend({
  template: JST["recipes/mini_detail"],
  
  initialize: function () {
    this.listenTo(this.model, "all", this.render)
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
    event.preventDefault();
    var recipe = this.model;
    
    var recipe_id = $(event.target).attr("data-recipe-id");
    var fav = new FoodgawkerApp.Models.Favorite();
    
    fav.save( { recipe_id: recipe_id },{
      success: function () {
        alert("faved!")
        recipe.set("favorites", fav)
      }
      
    }); 
  },
  
  unfavorite: function () {
    event.preventDefault();
    
    var recipe = this.model;
    var fav = this.model.get("favorites");

    fav.destroy({
      success: function () {
        alert("unfaved")
        recipe.set("favorites", [])
      }
    });
  }
})