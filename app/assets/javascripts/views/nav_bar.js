FoodgawkerApp.Views.NavBar = Backbone.View.extend({
  template: JST["nav_bar"],
  
  events: {
    "click button#sign-in-btn": "signIn",
    "click button#sign-out-btn": "signOut", 
    "mouseover #search-nav": "showSearchForm"
  },
  
  initialize: function () {
    this.listenTo(FoodgawkerApp.Data.currentUser, "all", this.render);
    // this.searchHover();  
  },
  
  showSearchForm: function (event) {
    $("#search-form").slideToggle('500').css('display', 'block');
  },
  
  // searchHover: function () {
  //   $("#search-nav").hover(function() {
  //     $("#search-form").slideToggle('500').css('display', 'block');
  //   }, function () {
  //     $("#search-form").slideToggle('500');
  //   });
  // },
  
  render: function () {
    var content = this.template();
    this.$el.html(content);
    
    return this;
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