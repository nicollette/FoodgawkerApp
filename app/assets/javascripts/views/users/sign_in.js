FoodgawkerApp.Views.SignIn = Backbone.View.extend({
  template: JST["session/new"],
  
  events: {
    "click button#sign-in-button": "signIn", 
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
      $('button#sign-in-button').click();
    }
  },
  
  signIn: function (event) {
    event.preventDefault();
    var signInView = this;
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
        signInView.$("input#username").val("")
        signInView.$("input#password").val("")
        setTimeout(function () {
          FoodgawkerApp.Data.currentUser.set(response.attributes)          
        }, 1000);
      }
      // 
      // error: function (model, xhr, options) {
      //   // var errors = $.parseJSON(xhr.responseText).errors
      //   debugger;
      // }
    });
    
  }
})