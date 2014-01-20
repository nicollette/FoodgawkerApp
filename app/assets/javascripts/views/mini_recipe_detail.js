FoodgawkerApp.Views.MiniRecipeDetail = Backbone.View.extend({
  template: JST["recipes/mini_detail"],
  
  initialize: function () {
    this.listenTo(this.model, "all", this.render);
    this.listenTo(this.model.get("favorites"), "all", this.render);
  },
  
  childViews: [],
  
  events: {
    "click button#favorite": "favorite",
    "click button#unfavorite": "unfavorite"
  },
  
  render: function () {
    var content = this.template({ recipe: this.model });
    this.$el.html(content);
    
    if(!FoodgawkerApp.Data.currentUser) {
      this.addSignInModal();
    }
    
    return this;
  },
  
  addSignInModal: function () {
    var newSession = new FoodgawkerApp.Models.Session();
    var view = new FoodgawkerApp.Views.SignIn({
      model: newSession
    });
    this.childViews.push(view);
    this.$(".modal-body").html(view.render().$el);
  },
  
  favorite: function (event) {
    // if no user is logged in then display sign in page as modal when fav button is clicked
    event.preventDefault();
    var recipe = this.model;
    
    var recipe_id = $(event.target).attr("data-recipe-id");
    
    var fav = new FoodgawkerApp.Models.Favorite();
    fav.save( { recipe_id: recipe_id },{
      success: function () {
        alert("faved!")
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
        recipe.get("favorites").remove(fav)
      }
    });
  },
  
  removeAll: function () {
    this.childViews.forEach(function(childView) {
      childView.remove();
    })
    this.remove();
  }
})