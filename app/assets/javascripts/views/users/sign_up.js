FoodgawkerApp.Views.SignUp = Backbone.View.extend({
  template: JST["users/new"],
  
  events: {
    "click button": "signUp"
  },
  
  render: function () {
    var content = this.template();
    this.$el.html(content);
    
    return this;
  },
  
  signUp: function (event) {
    event.preventDefault();
    var signUpView = this;
    var user = this.model
    var attrs = $("#sign-up-form").serializeJSON();
    
    this.model.set(attrs);
    
    this.model.save({}, {
      success: function (response) {
        FoodgawkerApp.Data.session = new FoodgawkerApp.Models.Session({ 
          id: 1 
        });
        FoodgawkerApp.flash(
          ["Welcome " + response.attributes["username"] + "!"], 
          "success"
        );
        signUpView.$("input#username").val("")
        signUpView.$("input#password").val("")
        signUpView.$("input#email").val("")
        
        setTimeout(function () {
          FoodgawkerApp.Data.currentUser.set(response.attributes)          
        }, 1000);
      }
    });
  }
})