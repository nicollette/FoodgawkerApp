FoodgawkerApp.Views.RecipeDetail = Backbone.View.extend({
  template: JST["recipes/show"],
  
  events: {
    "click button#favorite": "favorite",
    "click button#unfavorite": "unfavorite",
    "click button#prev-btn": "previousRecipe",
    "click button#next-btn": "nextRecipe",
    "click button#share": "emailRecipe",
    "mouseenter button#share": "emailTooltip",
    "mouseenter button#signedout-share": "emailTooltip",
    
  },
  
  emailTooltip: function (event) {
    var view = this;
    this.$("#email-tooltip").show();
    $(event.currentTarget).mouseleave(function () {
      view.$("#email-tooltip").hide();
    })
  },
  
  initialize: function () {
    this.listenTo(this.model, "all", this.render);
    this.listenTo(this.model.get("favorites"), "all", this.render);
    this.listenTo(FoodgawkerApp.Data.currentUser, "all", this.render);
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
  
  previousRecipe: function () {
    $.ajax({
      type: 'GET',
      url: '/api/recipes/' + this.model.id + "/prev_recipe",
      success: function (response) {
         Backbone.history.navigate("recipes/"+ response.id, { trigger: true })
      }
    })
  },
  
  nextRecipe: function () {
    $.ajax({
      type: 'GET',
      url: '/api/recipes/' + this.model.id + "/next_recipe",
      success: function (response) {
         Backbone.history.navigate("recipes/"+ response.id, { trigger: true })
      }
    })
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