FoodgawkerApp.Models.Recipe = Backbone.Model.extend({
  toJSON: function () {
    var attributes = _.clone(this.attributes);
    attributes.recipe_categories_attributes = attributes.recipe_categories;
    delete attributes["recipe_categories"]
    
    return attributes;
    
  }
})