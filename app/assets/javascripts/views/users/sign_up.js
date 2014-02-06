FoodgawkerApp.Views.SignUp = Backbone.View.extend({
  template: JST["users/new"],
  
  events: {
    "click button#sign-up-button": "signUp",
    'keypress input#password': 'submitForm'
  },
  
  render: function () {
    var content = this.template();
    this.$el.html(content);
    
    return this;
  },
  
  submitForm: function (event) {
    if (event.keyCode != 13) { 
      return; 
    }
    else {
      $('button#sign-up-button').click();
    }
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
      },
      
      error: function () {
        FoodgawkerApp.flash(
          ["Sorry something went wrong! Please try signing up again."], "warning"
        );
      }
    });
  }
})