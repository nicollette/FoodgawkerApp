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
    $('#myModal').modal('hide')
    var session = this.model
    var attrs = $(event.target.form).serializeJSON();    
    this.model.set(attrs);
    
    this.model.save({}, {
      success: function (response) {
        FoodgawkerApp.Data.session = new FoodgawkerApp.Models.Session({
          id: 1
        });
        debugger;
        FoodgawkerApp.Data.currentUser = 
          new FoodgawkerApp.Models.User(response.attributes)
          // doesn't re-render index page when used as modal in minidetailView
        Backbone.history.navigate("", { trigger: true })
      }
    });
  }
})