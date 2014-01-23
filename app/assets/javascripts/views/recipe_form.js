FoodgawkerApp.Views.RecipeForm = Backbone.View.extend({
  template: JST["recipes/form"],
  
  events: {
    "click button#recipe-form-button": "submit",
    "click button#fill-form": "fillForm",
    "change input[type=file]": "encodeFile"
  },
  
  render: function () {
    var content = this.template();
    this.$el.html(content);
    
    return this;
  },
  
  fillForm: function (event) {
   event.preventDefault();
   var that = this;
   
   $("div#noImg").hide();
   $("img#preview").attr("src", '/pancakes.jpg'); 
   that.model.set({ sample: true });
   
   $("#photo-group").hide();
   $("#sample-photo-group").show();
   this.$("#title").val("cinnamon roll pancakes");  
this.$("#blog_url").val("http://minimalistbaker.com/vegan-cinnamon-roll-pancakes/");
  this.$("#description").val("These cinnamon roll pancakes are legit and only require 8 ingredients!")
  this.$("#ingredients").val("almond milk, vegan butter, whole wheat pastry flour, cinnamon, sugar, salt, yeast");  
  this.$("#total_time").val("65");
  
  this.$(".btn-group input#input-cat1").prop('checked', true);
  this.$("label#label-cat1").addClass('active');
  this.$(".btn-group input#input-cat2").prop('checked', true);
  this.$("label#label-cat2").addClass('active');
  },
  
  encodeFile: function (event) {
    var that = this;
    debugger;
    var file = event.currentTarget.files[0];
    
    console.log(file);

    var reader = new FileReader();
    reader.onload = function(e) {
        $("div#noImg").hide();
        $("img#preview").attr("src", e.target.result);
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
      FoodgawkerApp.flash(["Recipe added!"], "success")
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