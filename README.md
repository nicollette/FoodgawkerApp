[Veggawker](http://veggawker.com)
=========

Veggawker is a user-submitted vegan recipe website. Veggawker's minimal layout makes it easy to find intriguing recipes. Any blogger can submit a recipe which links to their blog with the full recipe. Recipes can be searched by keyword and category. 

You can use a guest login to see all the features by clicking the "Guest Log In" button in the navigation bar. All reipes can be favorites by clicking the heart button and all favorited recipes can be viewed by clicking the "Favorite Recipes" link in the nav bar. A user can also email the recipe to themselves by clicking the paper-plane button. Clicking a recipe's image will display a modal containing more information about the recipe. Clicking the photo image in the detail modal will open the blog containing the full recipe in a new tab. Clicking the "More Info" link will render a page containing more details about the recipe and some recommended recipes. 

Highlights
==========

*   Single-page app

*   Checks if a user is logged in before displaying the "submit recipe" or "favorite recipes" page.
    *   [https://github.com/nicollette/FoodgawkerApp/blob/master/app/helpers/sessions_helper.rb](https://github.com/nicollette/FoodgawkerApp/blob/master/app/helpers/sessions_helper.rb)
    
*   Custom SQL queries that are used by the search bar to find recipes based on keyword and categories

*   Used Paperclip gem to attach photos to recipes
    *   [https://github.com/nicollette/FoodgawkerApp/blob/master/app/models/recipe.rb](https://github.com/nicollette/FoodgawkerApp/blob/master/app/models/recipe.rb)
    
*   Custom Ajax request to get search results
    * [https://github.com/nicollette/FoodgawkerApp/blob/master/app/assets/javascripts/collections/recipes.js](https://github.com/nicollette/FoodgawkerApp/blob/master/app/assets/javascripts/collections/recipes.js)
    
*   Overrided parse and toJSON functions to handle associated data in Backbone
    * [https://github.com/nicollette/FoodgawkerApp/blob/master/app/assets/javascripts/models/recipe.js](https://github.com/nicollette/FoodgawkerApp/blob/master/app/assets/javascripts/models/recipe.js)

*   Nested submit recipe form creates Recipe and Category models in a single transaction
    * [https://github.com/nicollette/FoodgawkerApp/blob/master/app/assets/templates/recipes/form.jst.ejs] (https://github.com/nicollette/FoodgawkerApp/blob/master/app/assets/templates/recipes/form.jst.ejs)
    
*   Used Kamanari gem for infinite scroll
