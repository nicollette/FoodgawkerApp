FoodgawkerApp.Views.NavBar = Backbone.View.extend({
  template: JST["nav_bar"],
  
  events: {
    "click button#sign-in-btn": "signIn",
    "click button#sign-out-btn": "signOut"
  },
  
  initialize: function () {
    this.listenTo(FoodgawkerApp.Data.currentUser, "all", this.render);  
  },
  
  render: function () {
    var content = this.template();
    this.$el.html(content);
    
    return this;
  },
    
  signOut: function (event) {
    event.preventDefault();
    
    FoodgawkerApp.Data.session.destroy({
      success: function (resp) {
        // alert("signed out!")
        FoodgawkerApp.Data.currentUser.set("id", undefined);
        FoodgawkerApp.Data.session = undefined;
        FoodgawkerApp.flash(
          ["Goodbye " + resp.attributes["username"] + "!"], 
          "info"
        )
      }
    })
  }
})