FoodgawkerApp.Views.RecipeDetail = Backbone.View.extend({
  template: JST["recipes/show"],
  
  events: {
    "click button#favorite": "favorite",
    "click button#unfavorite": "unfavorite",
    "click button#prev-btn": "previousRecipe"
  },
  
  initialize: function () {
    this.listenTo(this.model, "all", this.render)
  },
  
  previousRecipe: function () {
    var currIdx = _.indexOf(FoodgawkerApp.Data.recipes.pluck("id"), this.model.id)
    var prevRecipeId = FoodgawkerApp.Data.recipes[currIdx - 1].id
    Backbone.history.navigate("recpies/"+ this.model.id - 1, { trigger: true })
  },
  
  render: function () {
    var relatedRecipes = this.selectRelatedRecipes();
    var content = this.template({ 
      recipe: this.model,
      relatedRecipes: relatedRecipes.models
    });
    this.$el.html(content);
    return this;
  },
 
  renderSideBar: function () {
    
  },
  
  getCategories: function (recipe) {
    var categoryIds = [];
    recipe.get("categories").forEach(function (category) {
      categoryIds.push(category.id)
    });
    
    return categoryIds;
  },
  
  selectRelatedRecipes: function () {
    var detailView = this;
    var relatedRecipes = [];
    var relatedRecipeIds = [];
    var categoryIds = this.getCategories(this.model);
    
    categoryIds.forEach(function (catId) {
      FoodgawkerApp.Data.recipes.each(function (recipe) {
        var recipeCatIds = detailView.getCategories(recipe);
        if(_.contains(recipeCatIds, catId)) {
          relatedRecipes.push(recipe)
        };
      })
    })

    var selected = this.chooseRandom(relatedRecipes);
    return selected;
  },
  
  chooseRandom: function (recipes) {
    var selected = new FoodgawkerApp.Collections.Recipes();
    var maxIdx = recipes.length - 1
    while(selected.length < 6) {
      var randRecipe = recipes[Math.floor(Math.random() * maxIdx)]
      if(_.contains(selected.pluck("id"), randRecipe.id) === false) {
        selected.push(randRecipe)
      }
    }
    return selected;
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