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
    
    var user = this.model
    var attrs = $(event.target.form).serializeJSON();    
    this.model.set(attrs);
    
    this.model.save({}, {
      success: function () {
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