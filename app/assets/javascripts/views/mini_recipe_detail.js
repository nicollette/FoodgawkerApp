FoodgawkerApp.Views.MiniRecipeDetail = FoodgawkerApp.Views.DetailBase.extend({
  template: JST["recipes/mini_detail"],
  
  initialize: function () {
    FoodgawkerApp.Views.DetailBase.prototype.initialize.call(this);
  },

  events: {
    "click button#favorite": "favorite",
    "click button#unfavorite": "unfavorite",
    "click div.hover-header": "toggleModal", 
    "mouseenter img.detail": "showTitle", 
    "mouseenter button#share": "emailTooltip",
    "mouseenter button#signedout-share": "emailTooltip",
    "mouseenter button#share-modal": "emailTooltipModal",
    "click button#share": "emailRecipe",
    "click button#share-modal": "emailRecipeModal"
  },
  
  emailTooltipModal: function (event) {
    var view = this;
    this.$("#email-tooltip-modal").show();
    $(event.currentTarget).mouseleave(function () {
      view.$("#email-tooltip-modal").hide();
    })
  },
  
  render: function () {
    var content = this.template({ recipe: this.model });
    this.$el.html(content);
    return this;
  },
  
  emailRecipeModal: function (event) {
    var recipeId = $(event.target).attr("data-recipe-id");
    var view = this;
    $.ajax({
      type: 'GET',
      url: '/api/share',
      data: {
        url: this.model.get("blog_url")
      },
      success: function (response) {
        view.$("#email-tooltip-modal").hide();
        view.$("#email-text-modal").show().fadeOut(2000);
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
  }
})