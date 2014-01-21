# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ActiveRecord::Base.transaction do
  c1 = Category.create(:name => "Breakfast & Brunch")
  c5 = Category.create(:name => "Desserts")
  c6 = Category.create(:name => "Dinner")
  c7 = Category.create(:name => "Fruit")
  c8 = Category.create(:name => "Gluten Free")
  c10 = Category.create(:name => "Lunch")
  c12 = Category.create(:name => "Pasta & Noodles")
  c14 = Category.create(:name => "Rice & Grains")
  c15 = Category.create(:name => "Salads")
  c16 = Category.create(:name => "Sandwiches & Wraps")
  c18 = Category.create(:name => "Snacks")
  c19 = Category.create(:name => "Soups")
  
  u1 = User.create(:username => "nico", :email => "nico@gmail.com", :password => "password")
  u2 = User.create(:username => "guest1", :email => "guest1@gmail.com", :password => "password")
  u3 = User.create(:username => "guest2", :email => "guest2@gmail.com", :password => "password")
  
  r1 = Recipe.create(title: "joyous carrot cake", blog_url: "http://www.wholeheartedeats.com/2014/01/one-year-some-cake.html", description: "Carrot Cake healthy enough to eat for Breakfast {Gluten Free, Oil/ Refined Sugar Free}", ingredients: "carrot, sugar, apple sauce, vanilla, oats, baking soda, baking powder, cinnamon, sea salt, nutmeg, clove, pineapple, raisins, walnuts", total_time: 80, user_id: 1, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/carrot_cake.jpg'))
  RecipeCategory.create(recipe_id: r1.id, category_id: c5.id)
  RecipeCategory.create(recipe_id: r1.id, category_id: c8.id)
  
  r2 = Recipe.create(title: "pecan-hemp balls", blog_url: "http://cravinggreens.blogspot.ca/2014/01/pecan-hemp-balls.html", description: "Treat yourself to these quick and healthy pecan-hemp balls (no-bake). A delicious boost of healthy fats and dietary fiber.", ingredients: "pecans, wheat germ, flaxseeds, hemp seeds, cinnamon, nutmeg, salt, apple butter, flaxseed oil", total_time: 20, user_id: 1, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/hemp_balls.jpg'))
  RecipeCategory.create(recipe_id: r2.id, category_id: c1.id)
  RecipeCategory.create(recipe_id: r2.id, category_id: c5.id)
  RecipeCategory.create(recipe_id: r2.id, category_id: c18.id)

  r3 = Recipe.create(title: "mushroom asparagus risotto", blog_url: "http://www.munatycooking.com/2013/12/mushroom-asparagus-risotto-lunchbox-review.html", description: "Creamy and low in calorie risotto.", ingredients: "asparagus, white mushroom, Arborio rice, onion, water, olive oil, salt, black pepper", total_time: 35, user_id: 1, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/m_a_risotto.jpg'))
  RecipeCategory.create(recipe_id: r3.id, category_id: c6.id)
  RecipeCategory.create(recipe_id: r3.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r3.id, category_id: c14.id)
  
  r4 = Recipe.create(title: "spicy butternut squash with quinoa", blog_url: "http://thehonoursystem.com/2014/01/20/spicy-roasted-butternut-squash-with-quinoa-dried-cranberries/", description: "Spicy Roasted Butternut Squash with Quinoa & Dried Cranberries. Gluten Free! Tastes even better for lunch the next day!", ingredients: "butternut squash, shallots, garlic cloves, olive oil, chili flakes, sea salt, pepper, dried cranberries", total_time: 45, user_id: 1, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/m_a_risotto.jpg'))
  RecipeCategory.create(recipe_id: r4.id, category_id: c6.id)
  RecipeCategory.create(recipe_id: r4.id, category_id: c8.id)
  RecipeCategory.create(recipe_id: r4.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r4.id, category_id: c14.id)
  
  r5 = Recipe.create(title: "grilled tofu with citrus salsa", blog_url: "http://golubkakitchen.com/2014/01/ginger-marinated-tofu-with-citrus-salsa.html", description: "Ginger marinated tofu with citrus salsa.", ingredients: "grapefruit, orange, avocado, red onion, jalapeno chile, cilantro, sea salt, black pepper, lime, extra-firm tofu, tamari, mirin wine, honey, ginger", total_time: 60, user_id: 1, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/tofu_citrus.jpg'))
  RecipeCategory.create(recipe_id: r5.id, category_id: c6.id)
  RecipeCategory.create(recipe_id: r5.id, category_id: c7.id)
  RecipeCategory.create(recipe_id: r5.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r5.id, category_id: c14.id)

  r6 = Recipe.create(title: "pistachio ice cream", blog_url: "http://nutritionstripped.com/pistachio-ice-cream/#.Ut4RKmTTky5", description: "A delicious, thick, and creamy non-dairy ice cream with pistachios!", ingredients: "bananas, almond milk, pistachio, vanilla, spirulina, cinnamon", total_time: 15, user_id: 1, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/pistachio_ic.jpg'))
  RecipeCategory.create(recipe_id: r6.id, category_id: c5.id)

  r7 = Recipe.create(title: "thai pumpkin and coconut soup", blog_url: "http://circusgardener.com/2013/11/03/thai-pumpkin-and-coconut-soup/", description: "Thai pumpkin and coconut soup - a stunningly good soup, perfect for a cold winter's day.", ingredients: "pumpkin, onion, coconut milk, vegetable stock, extra virgin olive oil, sea salt, red chillies, coriander, cumin, lemongrass stalks, ginger, garlic, red onion, lime", total_time: 50, user_id: 1, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/pump_coco_soup.jpg'))
  RecipeCategory.create(recipe_id: r7.id, category_id: c6.id)
  RecipeCategory.create(recipe_id: r7.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r7.id, category_id: c19.id)

  r8 = Recipe.create(title: "spicy wasabi hummus", blog_url: "http://forealslife.com/blog/spicy-wasabi-hummus-oil-and-tahini-free", description: "Spicy Wasabi Hummus with toasted sesame seeds. Perfect for spicy food lovers! (Hint - it's really good on a baked potato!)", ingredients: "chickpeas, rice vinegar, wasabi, soy sauce, water, seasame seeds, garlic", total_time: 10, user_id: 1, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/wasabi_hum.jpg'))
  RecipeCategory.create(recipe_id: r8.id, category_id: c8.id)
  RecipeCategory.create(recipe_id: r8.id, category_id: c18.id)


  r9 = Recipe.create(title: "creamy mushroom & quinoa soup", blog_url: "http://www.queenofquinoa.me/2014/01/mushroom-quinoa-soup/", description: "This soup is made creamy and rich with coconut milk, then filled with meaty mushrooms & protein-rich quinoa.", ingredients: "olive oil, mushrooms, shallots, garlic, quinoa flour, coconut milk, vegetable broth, lemon, salt, pepper, sriracha, chives", total_time: 45, user_id: 1, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/mq_soup.jpg'))
  RecipeCategory.create(recipe_id: r9.id, category_id: c6.id)
  RecipeCategory.create(recipe_id: r9.id, category_id: c8.id)
  RecipeCategory.create(recipe_id: r9.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r9.id, category_id: c19.id)

  r10 = Recipe.create(title: "easy lemon herb spaghetti", blog_url: "http://www.sugardishme.com/2014/01/17/easy-lemon-herb-spaghetti/", description: "Dinner on the table in 20 minutes or less with this simple pasta dish that's loaded with flavor.", ingredients: "whole wheat spaghetti, olive oil, garlic, lemon, panko bread crumbs, basil, oregano, salt, black pepper, red pepper flakes", total_time: 20, user_id: 1, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/mq_soup.jpg'))
  RecipeCategory.create(recipe_id: r10.id, category_id: c6.id)
  RecipeCategory.create(recipe_id: r10.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r10.id, category_id: c12.id)

  r11 = Recipe.create(title: "baked donuts", blog_url: "http://www.myitaliansmorgasbord.com/2014/01/19/egg-and-dairy-free-baked-yeasted-doughnuts-with-strawberry-icing/", description: "Egg and Dairy-Free Baked Yeasted Doughnuts with Strawberry Icing", ingredients: "bread flour, water, soy flour, sea salt, sugar, yeast, strawberries", total_time: 60, user_id: 1, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/donuts.jpg'))
  RecipeCategory.create(recipe_id: r11.id, category_id: c1.id)
  RecipeCategory.create(recipe_id: r11.id, category_id: c5.id)
  RecipeCategory.create(recipe_id: r11.id, category_id: c7.id)
  RecipeCategory.create(recipe_id: r11.id, category_id: c18.id)

  r12 = Recipe.create(title: "blueberry oat muffins", blog_url: "http://www.oatmealwithafork.com/2014/01/17/sugar-free-guilt-free-blueberry-oat-muffins-gf-vegan/", description: "Sugar-Free, Guilt-Free Blueberry Oat Muffins...made from whole food ingredients like oats and dates, and only 106 calories each!", ingredients: "dates, applesauce, oil, dairy-free milk, lemon juice, oats, brown rice flour, baking powder, baking soda, sea salt, cinnamon, stevia, blueberries", total_time: 35, user_id: 1, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/bo_muffins.jpg'))
  RecipeCategory.create(recipe_id: r12.id, category_id: c1.id)
  RecipeCategory.create(recipe_id: r12.id, category_id: c5.id)
  RecipeCategory.create(recipe_id: r12.id, category_id: c7.id)
  RecipeCategory.create(recipe_id: r12.id, category_id: c8.id)
  RecipeCategory.create(recipe_id: r12.id, category_id: c18.id)
  
  r13 = Recipe.create(title: "coconut quinoa granola", blog_url: "http://mangiablog.com/2014/01/13/keen-wah/", description: "A bowl of crunchy quinoa granola chock full of coconut, almonds, & goji berries. Perfect for breakfast or snack. Gluten-free.", ingredients: "quinoa, coconut flakes, almonds, cinnamon, salt, maple syrup, extra virgin olive oil, dried goji berries", total_time: 30, user_id: 1, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r13.jpg'))
  RecipeCategory.create(recipe_id: r13.id, category_id: c1.id)
  RecipeCategory.create(recipe_id: r13.id, category_id: c7.id)
  RecipeCategory.create(recipe_id: r13.id, category_id: c8.id)
  RecipeCategory.create(recipe_id: r13.id, category_id: c14.id)
  RecipeCategory.create(recipe_id: r13.id, category_id: c18.id)
  
  r14 = Recipe.create(title: "cinnamon raison buns", blog_url: "http://swissmissinthekitchen.blogspot.ch/2014/01/vegan-cinnamon-raisin-buns.html", description: "Vegan cinnamon raisin buns made with coconut oil and spelt flour!", ingredients: "spelt flour, salt, maple syrup, stevia, vanilla, yeast, almond milk, coconut oil, raisins, cinnamon", total_time: 60, user_id: 1, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/crbuns.jpg'))
  RecipeCategory.create(recipe_id: r14.id, category_id: c1.id)
  RecipeCategory.create(recipe_id: r14.id, category_id: c5.id)
  RecipeCategory.create(recipe_id: r14.id, category_id: c8.id)
  RecipeCategory.create(recipe_id: r14.id, category_id: c18.id)

  r15 = Recipe.create(title: "banana pecan pancakes", blog_url: "http://thefitchen.com/2013/12/19/banana-pecan-pancakes/", description: "Healthy, easy pancakes – done in under 30 minutes! Hearty, fluffy, nutty, and caramel-y. Plus, they’re vegan and gluten-free!", ingredients: "oat flour, pecans, coconut milk, baking powder, vanilla, ground flax, sea salt, maple syrup, coconut oil", total_time: 30, user_id: 1, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r15.jpg'))
  RecipeCategory.create(recipe_id: r15.id, category_id: c1.id)
  RecipeCategory.create(recipe_id: r15.id, category_id: c7.id)
  RecipeCategory.create(recipe_id: r15.id, category_id: c8.id)
  
  r16 = Recipe.create(title: "soyrizo kelp noodle casserole", blog_url: "http://www.fellowshipofthevegetable.com/soyrizo-kelp-noodle-casserole/", description: "Kelp noodles baked with spicy soyrizo, sautéed veggies and tomato sauce.", ingredients: "kelp noodles, olive oil, onion, celery, soyrizo, tomato sauce, daiya cheese, parsley", total_time: 55, user_id: 2, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r16.jpg'))
  RecipeCategory.create(recipe_id: r16.id, category_id: c6.id)
  RecipeCategory.create(recipe_id: r16.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r16.id, category_id: c12.id)

  r17 = Recipe.create(title: "easy white bean and tomato soup", blog_url: "http://makingthymeforhealth.com/2013/12/10/easy-white-bean-tomato-soup-vegan/", description: "Easy White Bean & Tomato Soup- a vegan soup that's ready in thirty minutes.", ingredients: "white beans, marinara sauce, vegetable broth, olive oil, swiss chard, onion, carrots, garlic, oregano, salt, pepper, whole wheat elbows", total_time: 45, user_id: 2, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r17.jpg'))
  RecipeCategory.create(recipe_id: r17.id, category_id: c6.id)
  RecipeCategory.create(recipe_id: r17.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r17.id, category_id: c12.id)
  RecipeCategory.create(recipe_id: r17.id, category_id: c19.id)
  
  r18 = Recipe.create(title: "raw thai noodle salad", blog_url: "http://www.floridacoastalcooking.com/2013/12/raw-thai-noodle-salad.html", description: "Raw Thai Noodle Salad ~ Easy, Gluten Free and Vegan", ingredients: "kelp noodles, broccoli, green onion, red cabbage, carrots, seasame seeds, cilantro, nut butter, ume plum vinegar, agave, chili sauce", total_time: 15, user_id: 2, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r18.jpg'))
  RecipeCategory.create(recipe_id: r18.id, category_id: c6.id)
  RecipeCategory.create(recipe_id: r18.id, category_id: c8.id)
  RecipeCategory.create(recipe_id: r18.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r18.id, category_id: c12.id)
  RecipeCategory.create(recipe_id: r18.id, category_id: c15.id)
  
  
  r19 = Recipe.create(title: "vegan cheesy baked pesto mac", blog_url: "http://boldvegan.com/cheesy-baked-pesto-mac-with-walnut-parm-gluten-free-soy-free/", description: "Vegan Cheesy Baked Pesto Mac with Walnut Parmesan (Gluten Free and Soy Free).", ingredients: "potato, carrot, onion, water, walnuts, nutritional yeast, basil, garlic, olive oil, turmeric powder, sea salt, pepper, quinoa pasta, walnuts", total_time: 50, user_id: 2, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r19.jpg'))
  RecipeCategory.create(recipe_id: r19.id, category_id: c6.id)
  RecipeCategory.create(recipe_id: r19.id, category_id: c8.id)
  RecipeCategory.create(recipe_id: r19.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r19.id, category_id: c12.id)
  
  r20 = Recipe.create(title: "spicy miso udon noodle soup", blog_url: "http://blog.seasonwithspice.com/2013/10/miso-udon-noodle-soup-recipe.html", description: "Miso Udon Noodle Soup with Spicy Korean Chili Dressing", ingredients: "udon noodles, water, shiitake mushrooms, silken tofu, miso paste, spinach, nori, scallions", total_time: 20, user_id: 2, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r20.jpg'))
  RecipeCategory.create(recipe_id: r20.id, category_id: c6.id)
  RecipeCategory.create(recipe_id: r20.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r20.id, category_id: c12.id)
  RecipeCategory.create(recipe_id: r20.id, category_id: c19.id)

  r21 = Recipe.create(title: "quinoa stuffed avocados", blog_url: "http://theleancleaneatingmachine.com/2014/01/17/quinoa-stuffed-avocados/", description: "Healthy and refreshing quinoa stuffed avocados make a great appetizer or light meal.", ingredients: "quinoa, vegetable broth, avocado, lime, cilantro, sriracha", total_time: 45, user_id: 2, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r21.jpg'))
  RecipeCategory.create(recipe_id: r21.id, category_id: c8.id)
  RecipeCategory.create(recipe_id: r21.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r21.id, category_id: c14.id)
  RecipeCategory.create(recipe_id: r21.id, category_id: c15.id)
  RecipeCategory.create(recipe_id: r21.id, category_id: c18.id)
  
  r22 = Recipe.create(title: "goji banana mango oats", blog_url: "http://nutritionstripped.com/goji-banana-mango-oats/#.UtftCGRDvHs", description: "A gluten free breakfast porridge with oatmeals, bananas, goji berries, and mango.", ingredients: "gluten-free oats, almond milk, banana, mango, goji berries, cinnamon, vanilla", total_time: 20, user_id: 2, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r22.jpg'))
  RecipeCategory.create(recipe_id: r22.id, category_id: c1.id)
  RecipeCategory.create(recipe_id: r22.id, category_id: c7.id)
  RecipeCategory.create(recipe_id: r22.id, category_id: c8.id)
  RecipeCategory.create(recipe_id: r22.id, category_id: c14.id)
  RecipeCategory.create(recipe_id: r22.id, category_id: c18.id)
  
  r23 = Recipe.create(title: "curried bulgur wheat salad", blog_url: "http://www.greatbritishchefs.com/community/curried-bulgur-wheat-salad-recipe", description: "Curried Bulgur Wheat Salad", ingredients: "bulgur wheat, olive oil, agave nectar, curry powder, salt, black pepper, carrot, green pepper, spring onions, sweetcorn, pine nuts, coriander", total_time: 20, user_id: 2, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r23.jpg'))
  RecipeCategory.create(recipe_id: r23.id, category_id: c6.id)
  RecipeCategory.create(recipe_id: r23.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r23.id, category_id: c14.id)
  RecipeCategory.create(recipe_id: r23.id, category_id: c15.id)
  
  r24 = Recipe.create(title: "vegan naked burrito", blog_url: "http://vegieproject.com/vegan-naked-burrito/", description: "Vegan naked burrito with brown rice, black beans, pico de gallo salsa, guacamole and charred corn.", ingredients: "brown rice, black beans, onion, garlic, cumin, paprika, corn, olive oil, tomatoes, lime, avocado", total_time: 30, user_id: 2, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r24.jpg'))
  RecipeCategory.create(recipe_id: r24.id, category_id: c6.id)
  RecipeCategory.create(recipe_id: r24.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r24.id, category_id: c14.id)
  RecipeCategory.create(recipe_id: r24.id, category_id: c16.id)

  r25 = Recipe.create(title: "winter quinoa croquettes", blog_url: "http://chelrabbit.com/2013/12/17/quinoa-croquettes/", description: "Quinoa Croquettes with pecans and cranberries. With a Satsuma Mandarin Sauce.", ingredients: "quinoa, scallion, garlic, salt, lemon, buckwheat flour, oat flour, tapioca flour, pecans, cranberries, satsuma mandarin juice, soy sauce, maple syrup, ginger", total_time: 25, user_id: 2, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r25.jpg'))
  RecipeCategory.create(recipe_id: r25.id, category_id: c6.id)
  RecipeCategory.create(recipe_id: r25.id, category_id: c8.id)
  RecipeCategory.create(recipe_id: r25.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r25.id, category_id: c14.id)
  RecipeCategory.create(recipe_id: r25.id, category_id: c18.id)
  
  r26 = Recipe.create(title: "deconstructed falafel bowl", blog_url: "http://veganyackattack.com/2014/01/18/deconstructed-falafel-bowl/", description: "Healthy, easy and delicious bowl of Falafel goodness, without all of the work!", ingredients: "chickpeas, lettuce, cucumber, tomatoes, hummus, tahini, garlic, cumin, coriander, salt, pepper, cayeene, lemon", total_time: 50, user_id: 2, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r26.jpg'))
  RecipeCategory.create(recipe_id: r26.id, category_id: c6.id)
  RecipeCategory.create(recipe_id: r26.id, category_id: c8.id)
  RecipeCategory.create(recipe_id: r26.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r26.id, category_id: c15.id)
  
  r27 = Recipe.create(title: "chickpea salad stuffed avocados", blog_url: "http://coconutandberries.com/2014/01/13/chickpea-salad-stuffed-avocados/", description: "A fun way to serve this delicious and nutritious food. Chickpea Salad Stuffed Avocados.", ingredients: "chickpeas, carrot, garlic, olive oil, lime, tamari, cayenne pepper, avocados", total_time: 15, user_id: 2, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r27.jpg'))
  RecipeCategory.create(recipe_id: r27.id, category_id: c18.id)
  RecipeCategory.create(recipe_id: r27.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r27.id, category_id: c15.id)
  
  r28 = Recipe.create(title: "roasted sweet potato salad", blog_url: "http://joanne-eatswellwithothers.com/2013/12/roasted-sweet-potato-salad-with-cranberry-chipotle-dressing.html", description: "Add a little bit of spice to your table with this sweet and smoky roasted sweet potato salad with cranberry-chipotle dressing.", ingredients: "sweet potatoes, olive oil, salt, black pepper, cranberries, honey, chipotle chile, pepitas, scallions, cilantro", total_time: 35, user_id: 2, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r28.jpg'))
  RecipeCategory.create(recipe_id: r28.id, category_id: c7.id)
  RecipeCategory.create(recipe_id: r28.id, category_id: c8.id)
  RecipeCategory.create(recipe_id: r28.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r28.id, category_id: c15.id)
  RecipeCategory.create(recipe_id: r28.id, category_id: c18.id) 
  
  r29 = Recipe.create(title: "chickpea and avocado salad sandwich", blog_url: "http://jordansfamilyoffoodies.com/2014/01/06/chickpea-and-avocado-salad-sandwich/", description: "Pan roasted chickpeas with smoked paprika, cilantro, crunchy red onion, and smooth creamy avocado make up this delicious sandwich.", ingredients: "garbanzo beans, avocado, red onion, cilantro, lime, paprika, spinach, bread, dijon mustard", total_time: 35, user_id: 2, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r29.jpg'))
  RecipeCategory.create(recipe_id: r29.id, category_id: c8.id)
  RecipeCategory.create(recipe_id: r29.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r29.id, category_id: c15.id)
  RecipeCategory.create(recipe_id: r29.id, category_id: c16.id)
  
  r30 = Recipe.create(title: "autumn kale salad", blog_url: "http://blog.vegancuts.com/recipes/autumn-kale-salad-recipe/", description: "A sweet, Autumn Kale Salad with roasted sweet potatoes, and a citrus vinaigrette.", ingredients: "sweet potatoes, orange juice, olive oil, agave nectar, apple cider vinegar, dijon mustard, ginger, cinnamon, kale, cranberries", total_time: 35, user_id: 2, photo: File.open('/Users/Nicollette/Desktop/final_project/photos/r30.jpg'))
  RecipeCategory.create(recipe_id: r30.id, category_id: c6.id)
  RecipeCategory.create(recipe_id: r30.id, category_id: c7.id)
  RecipeCategory.create(recipe_id: r30.id, category_id: c8.id)
  RecipeCategory.create(recipe_id: r30.id, category_id: c10.id)
  RecipeCategory.create(recipe_id: r30.id, category_id: c15.id)
end