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
        FoodgawkerApp.Data.currentUser = user.id
        Backbone.history.navigate("", { trigger: true })
      }
    });
  }
})