FoodgawkerApp.Views.RecipeForm = Backbone.View.extend({
  template: JST["recipes/form"],
  
  events: {
    "click button": "submit"
  },
  
  render: function () {
    var content = this.template();
    this.$el.html(content);
    
    return this;
  },
  
  submit: function (event) {
    event.preventDefault();
    var attrs = this.$el.serializeJSON();
    var success = function() {
      Backbone.history.navigate("", { trigger: true })
    };

    this.model.set(attrs);
    
    if(this.model.isNew()){
      this.collection.create(this.model, {
        success: success
      })
    } else {
      this.model.save({}, {
        success: success
      });
    }
  }
})