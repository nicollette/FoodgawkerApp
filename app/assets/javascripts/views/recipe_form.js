FoodgawkerApp.Views.RecipeForm = Backbone.View.extend({
  template: JST["recipes/form"],
  
  events: {
    "click button": "submit",
    "change input[type=file]": "encodeFile"
  },
  
  render: function () {
    var content = this.template();
    this.$el.html(content);
    
    return this;
  },
  
  encodeFile: function (event) {
    var that = this;
    var file = event.currentTarget.files[0];
    
    console.log(file);

    var reader = new FileReader();
    reader.onload = function(e) {
        console.log(e.target.result);
        that.model.set({ photo: e.target.result });
    };
    
    reader.onerror = function(stuff) {
        console.log("error", stuff)
        console.log (stuff.getMessage())
    };
    
    reader.readAsDataURL(file);
  },
    
  submit: function (event) {
    event.preventDefault();
    var attrs = $(event.target.form).serializeJSON();
    var success = function() {
      Backbone.history.navigate("", { trigger: true })
    };
    
    this.model.set(attrs);
    this.model.set("favorites", new FoodgawkerApp.Collections.Favorites())
    
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