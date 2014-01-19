FoodgawkerApp.Views.NavBar = Backbone.View.extend({
  template: JST["nav_bar"],
  
  events: {
    "click button#sign-out-btn": "signOut"
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
        alert("signed out!")
        FoodgawkerApp.Data.currentUser = undefined;
        FoodgawkerApp.Data.session = undefined;
        var navView = new FoodgawkerApp.Views.NavBar();
        Backbone.history.navigate("", { trigger: true });
        
        $("#nav-section").html(navView.render().$el);
      }
    })
  }
})