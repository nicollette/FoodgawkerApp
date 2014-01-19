FoodgawkerApp.Views.Alerts = Backbone.View.extend({
  initialize: function (options) {
    this.message = options.message;
    this.classType = options.classType;
  },
    
  template: JST["alerts"],
  
  render: function () {
    var content = this.template({ 
      message: this.message, 
      classType: this.classType 
    });
    this.$el.html(content);
    
    return this;
  }
});