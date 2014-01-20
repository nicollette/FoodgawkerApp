FoodgawkerApp.Views.NavBar = Backbone.View.extend({
  template: JST["nav_bar"],
  
  events: {
    "click button#sign-in-btn": "signIn",
    "click button#sign-out-btn": "signOut"
  },
  
  render: function () {
    var content = this.template();
    this.$el.html(content);
    
    // var signInView = new FoodgawkerApp.Views.SignIn();
    // $("#container").append(signInView.render().$el);
    // debugger;
    
    
    return this;
  },
  
  signIn: function (event) {
    event.preventDefault();
    
  },
  
  signOut: function (event) {
    event.preventDefault();
    
    FoodgawkerApp.Data.session.destroy({
      success: function (resp) {
        alert("signed out!")
        FoodgawkerApp.Data.currentUser = undefined;
        FoodgawkerApp.Data.session = undefined;
        var navView = new FoodgawkerApp.Views.NavBar();
        // if i click sign out btn on root page, the router index method isn't run and the nav bar isn't updated, and neither is root page
        // currently only rendering nav bar in the index router action
        Backbone.history.navigate("", { trigger: true });
        
        $("#nav-section").html(navView.render().$el);
      }
    })
  }
})