FoodgawkerApp.Views.SignIn = Backbone.View.extend({
  template: JST["session/new"],
  
  events: {
    "click button": "signIn"
  },
  
  render: function () {
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
        FoodgawkerApp.Data.session = new FoodgawkerApp.Models.Session({
          id: 1
        });
        FoodgawkerApp.Data.currentUser = 
          new FoodgawkerApp.Models.User(response.attributes)
        Backbone.history.navigate("", { trigger: true })
      }
    });
  }
})