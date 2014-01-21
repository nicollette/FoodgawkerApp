FoodgawkerApp.Views.SignIn = Backbone.View.extend({
  template: JST["session/new"],
  
  events: {
    "click button#sign-in-button": "signIn"
  },
  
  render: function () {
    var content = this.template();
    this.$el.html(content);
    
    return this;
  },
  
  signIn: function (event) {
    event.preventDefault();
    this.model = new FoodgawkerApp.Models.Session();
    var session = this.model
    var attrs = $("#sign-in-form").serializeJSON();
    this.model.set(attrs);

    this.model.save({}, {
      success: function (response) {
        FoodgawkerApp.Data.session = session;
        delete response.attributes["user"];
        FoodgawkerApp.flash(
          ["Welcome " + response.attributes["username"] + "!"], 
          "success"
        )
        
        setTimeout(function () {
          FoodgawkerApp.Data.currentUser.set(response.attributes)          
        }, 1000);

      }
    });
    
  }
})