FoodgawkerApp.Views.NavBar = Backbone.View.extend({
  template: JST["nav_bar"],
  
  events: {
    "click button#sign-in-btn": "signIn",
    "click button#sign-out-btn": "signOut", 
    "mouseover #search-nav": "showSearchForm"
  },
  
  initialize: function () {
    this.listenTo(FoodgawkerApp.Data.currentUser, "all", this.render);
  },
  
  showSearchForm: function (event) {
    $("#search-form").slideDown('500').css('display', 'block');
    
    $("#search-view").mouseleave(function () {
      $("#search-form").slideUp('500');
    })
  },
  
  render: function () {
    var content = this.template();
    this.$el.html(content);
    
    this.appendSearchView();
    return this;
  },
  
  appendSearchView: function () {
    var view = new FoodgawkerApp.Views.Search();
    $("#search-view").html(view.render().$el);
  },
    
  signOut: function (event) {
    event.preventDefault();
    
    FoodgawkerApp.Data.session.destroy({
      success: function (resp) {
        FoodgawkerApp.Data.session = undefined;
        FoodgawkerApp.Data.currentUser.set("id", undefined);
        FoodgawkerApp.flash(
          ["Goodbye " + FoodgawkerApp.Data.currentUser.get("username") + "!"], 
          "info"
        )
      }
    })
  }
})