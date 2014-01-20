FoodgawkerApp.Views.SignIn = Backbone.View.extend({
  template: JST["session/new"],
  
  events: {
    "click button": "signIn"
  },
  
  render: function () {
    // display as modal
    var content = this.template();
    this.$el.html(content);
    
    return this;
  },
  
  signIn: function (event) {
    event.preventDefault();
    
    var session = this.model
    var attrs = $(event.target.form).serializeJSON();    
    this.model.set(attrs);
    
    this.model.save({}, {
      success: function (response) {
        $('#signInModal').modal('toggle')
        FoodgawkerApp.Data.session = session;
        delete response.attributes["user"]
        // FoodgawkerApp.Data.currentUser.set(response.attributes)
        FoodgawkerApp.Data.currentUser = new FoodgawkerApp.Models.User();

        // console.log("after setting curr user")
          // doesn't re-render index page when used as modal in minidetailView
        Backbone.history.navigate("", { trigger: true })
        
      }
    });
    
  }
})