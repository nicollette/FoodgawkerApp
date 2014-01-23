# encoding: utf-8
#   E# ncoding.default_external = Encoding::UTF_8
#   Encoding.default_internal = Encoding::UTF_8
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
  
  
  # 
  # u1 = User.create(:username => "nico", :email => "nico@gmail.com", :password => "password")
  # u2 = User.create(:username => "guest1", :email => "guest1@gmail.com", :password => "password")
  # u3 = User.create(:username => "guest2", :email => "guest2@gmail.com", :password => "password")
  #   
  # f1 = File.open(Rails.root.join('photos/carrot_cake.jpg').to_s)
  # r1 = Recipe.create(title: "joyous carrot cake", blog_url: "http://www.wholeheartedeats.com/2014/01/one-year-some-cake.html", description: "Carrot Cake healthy enough to eat for Breakfast {Gluten Free, Oil/ Refined Sugar Free}", ingredients: "carrot, sugar, apple sauce, vanilla, oats, baking soda, baking powder, cinnamon, sea salt, nutmeg, clove, pineapple, raisins, walnuts", total_time: 80, user_id: 1, photo: f1)
  # f1.close
  # RecipeCategory.create(recipe_id: r1.id, category_id: c5.id)
  # RecipeCategory.create(recipe_id: r1.id, category_id: c8.id)
  # 
  # f2 = File.open(Rails.root.join('photos/hemp_balls.jpg').to_s)
  # r2 = Recipe.create(title: "pecan-hemp balls", blog_url: "http://cravinggreens.blogspot.ca/2014/01/pecan-hemp-balls.html", description: "Treat yourself to these quick and healthy pecan-hemp balls (no-bake). A delicious boost of healthy fats and dietary fiber.", ingredients: "pecans, wheat germ, flaxseeds, hemp seeds, cinnamon, nutmeg, salt, apple butter, flaxseed oil", total_time: 20, user_id: 1, photo: f2)
  # f2.close
  # RecipeCategory.create(recipe_id: r2.id, category_id: c1.id)
  # RecipeCategory.create(recipe_id: r2.id, category_id: c5.id)
  # RecipeCategory.create(recipe_id: r2.id, category_id: c18.id)
  # 
  # f3 = File.open(Rails.root.join('photos/m_a_risotto.jpg').to_s)
  # r3 = Recipe.create(title: "mushroom asparagus risotto", blog_url: "http://www.munatycooking.com/2013/12/mushroom-asparagus-risotto-lunchbox-review.html", description: "Creamy and low in calorie risotto.", ingredients: "asparagus, white mushroom, Arborio rice, onion, water, olive oil, salt, black pepper", total_time: 35, user_id: 1, photo: f3)
  # f3.close
  # RecipeCategory.create(recipe_id: r3.id, category_id: c6.id)
  # RecipeCategory.create(recipe_id: r3.id, category_id: c10.id)
  # RecipeCategory.create(recipe_id: r3.id, category_id: c14.id)
  # 
  # f4 = File.open(Rails.root.join('photos/r4.jpg').to_s)   
  # r4 = Recipe.create(title: "spicy butternut squash with quinoa", blog_url: "http://thehonoursystem.com/2014/01/20/spicy-roasted-butternut-squash-with-quinoa-dried-cranberries/", description: "Spicy Roasted Butternut Squash with Quinoa & Dried Cranberries. Gluten Free! Tastes even better for lunch the next day!", ingredients: "butternut squash, shallots, garlic cloves, olive oil, chili flakes, sea salt, pepper, dried cranberries", total_time: 45, user_id: 1, photo: f4)
  # f4.close
  # RecipeCategory.create(recipe_id: r4.id, category_id: c6.id)
  # RecipeCategory.create(recipe_id: r4.id, category_id: c8.id)
  # RecipeCategory.create(recipe_id: r4.id, category_id: c10.id)
  # RecipeCategory.create(recipe_id: r4.id, category_id: c14.id)
  # 
  # f5 = File.open(Rails.root.join('photos/tofu_citrus.jpg').to_s)
  # r5 = Recipe.create(title: "grilled tofu with citrus salsa", blog_url: "http://golubkakitchen.com/2014/01/ginger-marinated-tofu-with-citrus-salsa.html", description: "Ginger marinated tofu with citrus salsa.", ingredients: "grapefruit, orange, avocado, red onion, jalapeno chile, cilantro, sea salt, black pepper, lime, extra-firm tofu, tamari, mirin wine, honey, ginger", total_time: 60, user_id: 1, photo: f5)
  # f5.close
  # RecipeCategory.create(recipe_id: r5.id, category_id: c6.id)
  # RecipeCategory.create(recipe_id: r5.id, category_id: c7.id)
  # RecipeCategory.create(recipe_id: r5.id, category_id: c10.id)
  # RecipeCategory.create(recipe_id: r5.id, category_id: c14.id)
  # 
  # f6 = File.open(Rails.root.join('photos/pistachio_ic.jpg').to_s)
  # r6 = Recipe.create(title: "pistachio ice cream", blog_url: "http://nutritionstripped.com/pistachio-ice-cream/#.Ut4RKmTTky5", description: "A delicious, thick, and creamy non-dairy ice cream with pistachios!", ingredients: "bananas, almond milk, pistachio, vanilla, spirulina, cinnamon", total_time: 15, user_id: 1, photo: f6)
  # f6.close
  # RecipeCategory.create(recipe_id: r6.id, category_id: c5.id)
  # 
  # f7 = File.open(Rails.root.join('photos/pump_coco_soup.jpg').to_s)
  # r7 = Recipe.create(title: "thai pumpkin and coconut soup", blog_url: "http://circusgardener.com/2013/11/03/thai-pumpkin-and-coconut-soup/", description: "Thai pumpkin and coconut soup - a stunningly good soup, perfect for a cold winter's day.", ingredients: "pumpkin, onion, coconut milk, vegetable stock, extra virgin olive oil, sea salt, red chillies, coriander, cumin, lemongrass stalks, ginger, garlic, red onion, lime", total_time: 50, user_id: 1, photo: f7)
  # f7.close
  # RecipeCategory.create(recipe_id: r7.id, category_id: c6.id)
  # RecipeCategory.create(recipe_id: r7.id, category_id: c10.id)
  # RecipeCategory.create(recipe_id: r7.id, category_id: c19.id)
  # 
  # f8 = File.open(Rails.root.join('photos/wasabi_hum.jpg').to_s)
  # r8 = Recipe.create(title: "spicy wasabi hummus", blog_url: "http://forealslife.com/blog/spicy-wasabi-hummus-oil-and-tahini-free", description: "Spicy Wasabi Hummus with toasted sesame seeds. Perfect for spicy food lovers! (Hint - it's really good on a baked potato!)", ingredients: "chickpeas, rice vinegar, wasabi, soy sauce, water, seasame seeds, garlic", total_time: 10, user_id: 1, photo: f8)
  # f8.close
  # RecipeCategory.create(recipe_id: r8.id, category_id: c8.id)
  # RecipeCategory.create(recipe_id: r8.id, category_id: c18.id)
  # 
  # f9 = File.open(Rails.root.join('photos/mq_soup.jpg').to_s)
  # r9 = Recipe.create(title: "creamy mushroom & quinoa soup", blog_url: "http://www.queenofquinoa.me/2014/01/mushroom-quinoa-soup/", description: "This soup is made creamy and rich with coconut milk, then filled with meaty mushrooms & protein-rich quinoa.", ingredients: "olive oil, mushrooms, shallots, garlic, quinoa flour, coconut milk, vegetable broth, lemon, salt, pepper, sriracha, chives", total_time: 45, user_id: 1, photo: f9)
  # f9.close
  # RecipeCategory.create(recipe_id: r9.id, category_id: c6.id)
  # RecipeCategory.create(recipe_id: r9.id, category_id: c8.id)
  # RecipeCategory.create(recipe_id: r9.id, category_id: c10.id)
  # RecipeCategory.create(recipe_id: r9.id, category_id: c19.id)
  # 
  # f10 = File.open(Rails.root.join('photos/r10.jpg').to_s)
  # r10 = Recipe.create(title: "easy lemon herb spaghetti", blog_url: "http://www.sugardishme.com/2014/01/17/easy-lemon-herb-spaghetti/", description: "Dinner on the table in 20 minutes or less with this simple pasta dish that's loaded with flavor.", ingredients: "whole wheat spaghetti, olive oil, garlic, lemon, panko bread crumbs, basil, oregano, salt, black pepper, red pepper flakes", total_time: 20, user_id: 1, photo: f10)
  # f10.close
  # RecipeCategory.create(recipe_id: r10.id, category_id: c6.id)
  # RecipeCategory.create(recipe_id: r10.id, category_id: c10.id)
  # RecipeCategory.create(recipe_id: r10.id, category_id: c12.id)
  # 
  # f11 = File.open(Rails.root.join('photos/donuts.jpg').to_s)
  # r11 = Recipe.create(title: "baked donuts", blog_url: "http://www.myitaliansmorgasbord.com/2014/01/19/egg-and-dairy-free-baked-yeasted-doughnuts-with-strawberry-icing/", description: "Egg and Dairy-Free Baked Yeasted Doughnuts with Strawberry Icing", ingredients: "bread flour, water, soy flour, sea salt, sugar, yeast, strawberries", total_time: 60, user_id: 1, photo: f11)
  # f11.close
  # RecipeCategory.create(recipe_id: r11.id, category_id: c1.id)
  # RecipeCategory.create(recipe_id: r11.id, category_id: c5.id)
  # RecipeCategory.create(recipe_id: r11.id, category_id: c7.id)
  # RecipeCategory.create(recipe_id: r11.id, category_id: c18.id)
  # 
  # f12 = File.open(Rails.root.join('photos/bo_muffins.jpg').to_s)
#   r12 = Recipe.create(title: "blueberry oat muffins", blog_url: "http://www.oatmealwithafork.com/2014/01/17/sugar-free-guilt-free-blueberry-oat-muffins-gf-vegan/", description: "Sugar-Free, Guilt-Free Blueberry Oat Muffins...made from whole food ingredients like oats and dates, and only 106 calories each!", ingredients: "dates, applesauce, oil, dairy-free milk, lemon juice, oats, brown rice flour, baking powder, baking soda, sea salt, cinnamon, stevia, blueberries", total_time: 35, user_id: 1, photo: f12)
#   f12.close
#   RecipeCategory.create(recipe_id: r12.id, category_id: c1.id)
#   RecipeCategory.create(recipe_id: r12.id, category_id: c5.id)
#   RecipeCategory.create(recipe_id: r12.id, category_id: c7.id)
#   RecipeCategory.create(recipe_id: r12.id, category_id: c8.id)
#   RecipeCategory.create(recipe_id: r12.id, category_id: c18.id)
#   
#   f13 = File.open(Rails.root.join('photos/r13.jpg').to_s)  
#   r13 = Recipe.create(title: "coconut quinoa granola", blog_url: "http://mangiablog.com/2014/01/13/keen-wah/", description: "A bowl of crunchy quinoa granola chock full of coconut, almonds, & goji berries. Perfect for breakfast or snack. Gluten-free.", ingredients: "quinoa, coconut flakes, almonds, cinnamon, salt, maple syrup, extra virgin olive oil, dried goji berries", total_time: 30, user_id: 1, photo: f13)
#   f13.close
#   RecipeCategory.create(recipe_id: r13.id, category_id: c1.id)
#   RecipeCategory.create(recipe_id: r13.id, category_id: c7.id)
#   RecipeCategory.create(recipe_id: r13.id, category_id: c8.id)
#   RecipeCategory.create(recipe_id: r13.id, category_id: c14.id)
#   RecipeCategory.create(recipe_id: r13.id, category_id: c18.id)
  # 
  # f14 = File.open(Rails.root.join('photos/crbuns.jpg').to_s)
  # r14 = Recipe.create(title: "cinnamon raison buns", blog_url: "http://swissmissinthekitchen.blogspot.ch/2014/01/vegan-cinnamon-raisin-buns.html", description: "Vegan cinnamon raisin buns made with coconut oil and spelt flour!", ingredients: "spelt flour, salt, maple syrup, stevia, vanilla, yeast, almond milk, coconut oil, raisins, cinnamon", total_time: 60, user_id: 1, photo: f14)
  # f14.close
  # RecipeCategory.create(recipe_id: r14.id, category_id: c1.id)
  # RecipeCategory.create(recipe_id: r14.id, category_id: c5.id)
  # RecipeCategory.create(recipe_id: r14.id, category_id: c8.id)
  # RecipeCategory.create(recipe_id: r14.id, category_id: c18.id)
  # 
  # f15 = File.open(Rails.root.join('photos/r15.jpg').to_s)
  # r15 = Recipe.create(title: "banana pecan pancakes", blog_url: "http://thefitchen.com/2013/12/19/banana-pecan-pancakes/", description: "Healthy, easy pancakes – done in under 30 minutes! Hearty, fluffy, nutty, and caramel-y. Plus, they’re vegan and gluten-free!", ingredients: "oat flour, pecans, coconut milk, baking powder, vanilla, ground flax, sea salt, maple syrup, coconut oil", total_time: 30, user_id: 1, photo: f15)
  # f15.close
  # RecipeCategory.create(recipe_id: r15.id, category_id: c1.id)
  # RecipeCategory.create(recipe_id: r15.id, category_id: c7.id)
  # RecipeCategory.create(recipe_id: r15.id, category_id: c8.id)
  
  # f16 = File.open(Rails.root.join('photos/r16.jpg').to_s)
  # r16 = Recipe.create(title: "soyrizo kelp noodle casserole", blog_url: "http://www.fellowshipofthevegetable.com/soyrizo-kelp-noodle-casserole/", description: "Kelp noodles baked with spicy soyrizo, sautéed veggies and tomato sauce.", ingredients: "kelp noodles, olive oil, onion, celery, soyrizo, tomato sauce, daiya cheese, parsley", total_time: 55, user_id: 2, photo: f16)
  # f16.close
  # RecipeCategory.create(recipe_id: r16.id, category_id: c6.id)
  # RecipeCategory.create(recipe_id: r16.id, category_id: c10.id)
  # RecipeCategory.create(recipe_id: r16.id, category_id: c12.id)
  # 
  # f17 = File.open(Rails.root.join('photos/r17.jpg').to_s)
  # r17 = Recipe.create(title: "easy white bean and tomato soup", blog_url: "http://makingthymeforhealth.com/2013/12/10/easy-white-bean-tomato-soup-vegan/", description: "Easy White Bean & Tomato Soup- a vegan soup that's ready in thirty minutes.", ingredients: "white beans, marinara sauce, vegetable broth, olive oil, swiss chard, onion, carrots, garlic, oregano, salt, pepper, whole wheat elbows", total_time: 45, user_id: 2, photo: f17)
  # f17.close
  # RecipeCategory.create(recipe_id: r17.id, category_id: c6.id)
  # RecipeCategory.create(recipe_id: r17.id, category_id: c10.id)
  # RecipeCategory.create(recipe_id: r17.id, category_id: c12.id)
  # RecipeCategory.create(recipe_id: r17.id, category_id: c19.id)
  # 
  # f18 = File.open(Rails.root.join('photos/r18.jpeg').to_s)
  # r18 = Recipe.create(title: "raw thai noodle salad", blog_url: "http://www.floridacoastalcooking.com/2013/12/raw-thai-noodle-salad.html", description: "Raw Thai Noodle Salad ~ Easy, Gluten Free and Vegan", ingredients: "kelp noodles, broccoli, green onion, red cabbage, carrots, seasame seeds, cilantro, nut butter, ume plum vinegar, agave, chili sauce", total_time: 15, user_id: 2, photo: f18)
  # f18.close
  # RecipeCategory.create(recipe_id: r18.id, category_id: c6.id)
  # RecipeCategory.create(recipe_id: r18.id, category_id: c8.id)
  # RecipeCategory.create(recipe_id: r18.id, category_id: c10.id)
  # RecipeCategory.create(recipe_id: r18.id, category_id: c12.id)
  # RecipeCategory.create(recipe_id: r18.id, category_id: c15.id)
  # 
  # f19 = File.open(Rails.root.join('photos/r19.jpeg').to_s)
  # r19 = Recipe.create(title: "vegan cheesy baked pesto mac", blog_url: "http://boldvegan.com/cheesy-baked-pesto-mac-with-walnut-parm-gluten-free-soy-free/", description: "Vegan Cheesy Baked Pesto Mac with Walnut Parmesan (Gluten Free and Soy Free).", ingredients: "potato, carrot, onion, water, walnuts, nutritional yeast, basil, garlic, olive oil, turmeric powder, sea salt, pepper, quinoa pasta, walnuts", total_time: 50, user_id: 2, photo: f19)
  # f19.close
  # RecipeCategory.create(recipe_id: r19.id, category_id: c6.id)
  # RecipeCategory.create(recipe_id: r19.id, category_id: c8.id)
  # RecipeCategory.create(recipe_id: r19.id, category_id: c10.id)
  # RecipeCategory.create(recipe_id: r19.id, category_id: c12.id)
  # 
  # f20 = File.open(Rails.root.join('photos/r20.jpeg').to_s)
  # r20 = Recipe.create(title: "spicy miso udon noodle soup", blog_url: "http://blog.seasonwithspice.com/2013/10/miso-udon-noodle-soup-recipe.html", description: "Miso Udon Noodle Soup with Spicy Korean Chili Dressing", ingredients: "udon noodles, water, shiitake mushrooms, silken tofu, miso paste, spinach, nori, scallions", total_time: 20, user_id: 2, photo: f20)
  # f20.close
  # RecipeCategory.create(recipe_id: r20.id, category_id: c6.id)
  # RecipeCategory.create(recipe_id: r20.id, category_id: c10.id)
  # RecipeCategory.create(recipe_id: r20.id, category_id: c12.id)
  # RecipeCategory.create(recipe_id: r20.id, category_id: c19.id)
  # 
  # f21 = File.open(Rails.root.join('photos/r21.jpg').to_s)
  # r21 = Recipe.create(title: "quinoa stuffed avocados", blog_url: "http://theleancleaneatingmachine.com/2014/01/17/quinoa-stuffed-avocados/", description: "Healthy and refreshing quinoa stuffed avocados make a great appetizer or light meal.", ingredients: "quinoa, vegetable broth, avocado, lime, cilantro, sriracha", total_time: 45, user_id: 2, photo: f21)
  # f21.close
  # RecipeCategory.create(recipe_id: r21.id, category_id: c8.id)
  # RecipeCategory.create(recipe_id: r21.id, category_id: c10.id)
  # RecipeCategory.create(recipe_id: r21.id, category_id: c14.id)
  # RecipeCategory.create(recipe_id: r21.id, category_id: c15.id)
  # RecipeCategory.create(recipe_id: r21.id, category_id: c18.id)
  # 
  # f22 = File.open(Rails.root.join('photos/r22.jpg').to_s)
  # r22 = Recipe.create(title: "goji banana mango oats", blog_url: "http://nutritionstripped.com/goji-banana-mango-oats/#.UtftCGRDvHs", description: "A gluten free breakfast porridge with oatmeals, bananas, goji berries, and mango.", ingredients: "gluten-free oats, almond milk, banana, mango, goji berries, cinnamon, vanilla", total_time: 20, user_id: 2, photo: f22)
  # f22.close
  # RecipeCategory.create(recipe_id: r22.id, category_id: c1.id)
  # RecipeCategory.create(recipe_id: r22.id, category_id: c7.id)
  # RecipeCategory.create(recipe_id: r22.id, category_id: c8.id)
  # RecipeCategory.create(recipe_id: r22.id, category_id: c14.id)
  # RecipeCategory.create(recipe_id: r22.id, category_id: c18.id)
  # 
  # f23 = File.open(Rails.root.join('photos/r23.jpg').to_s)
  # r23 = Recipe.create(title: "curried bulgur wheat salad", blog_url: "http://www.greatbritishchefs.com/community/curried-bulgur-wheat-salad-recipe", description: "Curried Bulgur Wheat Salad", ingredients: "bulgur wheat, olive oil, agave nectar, curry powder, salt, black pepper, carrot, green pepper, spring onions, sweetcorn, pine nuts, coriander", total_time: 20, user_id: 2, photo: f23)
  # f23.close
  # RecipeCategory.create(recipe_id: r23.id, category_id: c6.id)
  # RecipeCategory.create(recipe_id: r23.id, category_id: c10.id)
  # RecipeCategory.create(recipe_id: r23.id, category_id: c14.id)
  # RecipeCategory.create(recipe_id: r23.id, category_id: c15.id)
  
  # f24 = File.open(Rails.root.join('photos/r24.jpg').to_s)
#   r24 = Recipe.create(title: "vegan naked burrito", blog_url: "http://vegieproject.com/vegan-naked-burrito/", description: "Vegan naked burrito with brown rice, black beans, pico de gallo salsa, guacamole and charred corn.", ingredients: "brown rice, black beans, onion, garlic, cumin, paprika, corn, olive oil, tomatoes, lime, avocado", total_time: 30, user_id: 2, photo: f24)
#   f24.close
#   RecipeCategory.create(recipe_id: r24.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r24.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r24.id, category_id: c14.id)
#   RecipeCategory.create(recipe_id: r24.id, category_id: c16.id)
#   
#   f25 = File.open(Rails.root.join('photos/r25.jpg').to_s)
#   r25 = Recipe.create(title: "winter quinoa croquettes", blog_url: "http://chelrabbit.com/2013/12/17/quinoa-croquettes/", description: "Quinoa Croquettes with pecans and cranberries. With a Satsuma Mandarin Sauce.", ingredients: "quinoa, scallion, garlic, salt, lemon, buckwheat flour, oat flour, tapioca flour, pecans, cranberries, satsuma mandarin juice, soy sauce, maple syrup, ginger", total_time: 25, user_id: 2, photo: f25)
#   f25.close
#   RecipeCategory.create(recipe_id: r25.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r25.id, category_id: c8.id)
#   RecipeCategory.create(recipe_id: r25.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r25.id, category_id: c14.id)
#   RecipeCategory.create(recipe_id: r25.id, category_id: c18.id)
#   
#   f26 = File.open(Rails.root.join('photos/r26.jpg').to_s)
#   r26 = Recipe.create(title: "deconstructed falafel bowl", blog_url: "http://veganyackattack.com/2014/01/18/deconstructed-falafel-bowl/", description: "Healthy, easy and delicious bowl of Falafel goodness, without all of the work!", ingredients: "chickpeas, lettuce, cucumber, tomatoes, hummus, tahini, garlic, cumin, coriander, salt, pepper, cayeene, lemon", total_time: 50, user_id: 2, photo: f26)
#   f26.close
#   RecipeCategory.create(recipe_id: r26.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r26.id, category_id: c8.id)
#   RecipeCategory.create(recipe_id: r26.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r26.id, category_id: c15.id)
#   
#   f27 = File.open(Rails.root.join('photos/r27.jpg').to_s)
#   r27 = Recipe.create(title: "chickpea salad stuffed avocados", blog_url: "http://coconutandberries.com/2014/01/13/chickpea-salad-stuffed-avocados/", description: "A fun way to serve this delicious and nutritious food. Chickpea Salad Stuffed Avocados.", ingredients: "chickpeas, carrot, garlic, olive oil, lime, tamari, cayenne pepper, avocados", total_time: 15, user_id: 2, photo: f27)
#   f27.close
#   RecipeCategory.create(recipe_id: r27.id, category_id: c18.id)
#   RecipeCategory.create(recipe_id: r27.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r27.id, category_id: c15.id)
#   
#   f28 = File.open(Rails.root.join('photos/r28.jpg').to_s)
#   r28 = Recipe.create(title: "roasted sweet potato salad", blog_url: "http://joanne-eatswellwithothers.com/2013/12/roasted-sweet-potato-salad-with-cranberry-chipotle-dressing.html", description: "Add a little bit of spice to your table with this sweet and smoky roasted sweet potato salad with cranberry-chipotle dressing.", ingredients: "sweet potatoes, olive oil, salt, black pepper, cranberries, honey, chipotle chile, pepitas, scallions, cilantro", total_time: 35, user_id: 2, photo: f28)
#   f28.close
#   RecipeCategory.create(recipe_id: r28.id, category_id: c7.id)
#   RecipeCategory.create(recipe_id: r28.id, category_id: c8.id)
#   RecipeCategory.create(recipe_id: r28.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r28.id, category_id: c15.id)
#   RecipeCategory.create(recipe_id: r28.id, category_id: c18.id) 
#   
#   f29 = File.open(Rails.root.join('photos/r29.jpg').to_s)
#   r29 = Recipe.create(title: "chickpea and avocado salad sandwich", blog_url: "http://jordansfamilyoffoodies.com/2014/01/06/chickpea-and-avocado-salad-sandwich/", description: "Pan roasted chickpeas with smoked paprika, cilantro, crunchy red onion, and smooth creamy avocado make up this delicious sandwich.", ingredients: "garbanzo beans, avocado, red onion, cilantro, lime, paprika, spinach, bread, dijon mustard", total_time: 35, user_id: 2, photo: f29)
#   f29.close
#   RecipeCategory.create(recipe_id: r29.id, category_id: c8.id)
#   RecipeCategory.create(recipe_id: r29.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r29.id, category_id: c15.id)
#   RecipeCategory.create(recipe_id: r29.id, category_id: c16.id)
#   
#   f30 = File.open(Rails.root.join('photos/r30.jpeg').to_s)
#   r30 = Recipe.create(title: "autumn kale salad", blog_url: "http://blog.vegancuts.com/recipes/autumn-kale-salad-recipe/", description: "A sweet, Autumn Kale Salad with roasted sweet potatoes, and a citrus vinaigrette.", ingredients: "sweet potatoes, orange juice, olive oil, agave nectar, apple cider vinegar, dijon mustard, ginger, cinnamon, kale, cranberries", total_time: 35, user_id: 2, photo: f30)
#   f30.close
#   RecipeCategory.create(recipe_id: r30.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r30.id, category_id: c7.id)
#   RecipeCategory.create(recipe_id: r30.id, category_id: c8.id)
#   RecipeCategory.create(recipe_id: r30.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r30.id, category_id: c15.id)
#   
#   f31 = File.open(Rails.root.join('photos/r31.jpg').to_s)  
#   r31 = Recipe.create(title: "tempeh teriyaki summer rolls", blog_url: "http://www.riceandcoconut.com/2013/07/tempeh-teriyaki-summer-rolls.html", description: "Tempeh teriyaki summer rolls", ingredients: "vietnamese spring roll wrappers, tempeh, vegetable oil, teriyaki sauce, carrot, cucumber, lettuce, basil, cilantro", total_time: 15, user_id: 3, photo: f31)
#   f31.close
#   RecipeCategory.create(recipe_id: r31.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r31.id, category_id: c18.id)
#   RecipeCategory.create(recipe_id: r31.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r31.id, category_id: c16.id)
#   
#   f32 = File.open(Rails.root.join('photos/r32.jpg').to_s)
#   r32 = Recipe.create(title: "cranberry walnut chickpea salad sandwich", blog_url: "http://thesimpleveganista.blogspot.com/2013/11/cranberry-walnut-chickpea-salad-sandwich.html", description: "Cranberry Walnut Chickpea Salad Sandwich...Healthy, easy and delicious!", ingredients: "chickpeas, celery, dried cranberries, walnuts, scallions, tahini", total_time: 20, user_id: 3, photo: f32)
#   f32.close
#   RecipeCategory.create(recipe_id: r32.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r32.id, category_id: c15.id)
#   RecipeCategory.create(recipe_id: r32.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r32.id, category_id: c16.id)
#   
#   f33 = File.open(Rails.root.join('photos/r33.jpg').to_s)
#   r33 = Recipe.create(title: "portobello walnut tacos", blog_url: "http://www.fellowshipofthevegetable.com/portobello-walnut-tacos-wcilantro-lime-rice/", description: "Portobello Mushroom & Walnut Tacos w/Cilantro Lime Rice", ingredients: "rice, lime, cilantro, veggie broth, onion, cumin, walnuts, portobello mushrooms, avocado", total_time: 40, user_id: 3, photo: f33)
#   f33.close
#   RecipeCategory.create(recipe_id: r33.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r33.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r33.id, category_id: c16.id)
#   RecipeCategory.create(recipe_id: r33.id, category_id: c18.id)
#   
#   f34 = File.open(Rails.root.join('photos/r34.jpeg').to_s)
#   r34 = Recipe.create(title: "lentil sloppy joes", blog_url: "http://makingthymeforhealth.com/2013/12/02/lentil-sloppy-joes-vegan-and-gluten-free/", description: "Vegan Lentil Sloppy Joes: an easy meatless meal that will leave you fighting for the leftovers.", ingredients: "lentils, onion, carrots, bell pepper, paprika, tomatoes, mustard powder", total_time: 75, user_id: 3, photo: f34)
#   f34.close
#   RecipeCategory.create(recipe_id: r34.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r34.id, category_id: c14.id)
#   RecipeCategory.create(recipe_id: r34.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r34.id, category_id: c16.id)
#   RecipeCategory.create(recipe_id: r34.id, category_id: c18.id)
#   
#   f35 = File.open(Rails.root.join('photos/r35.jpeg').to_s)
#   r35 = Recipe.create(title: "spicy black bean burger", blog_url: "http://whatthehelldoveganseat.com/black-bean-sweet-potato-and-quinoa-burger/", description: "Delicious vegan burger made with black beans, sweet potato, quinoa, ginger, herbs and spices", ingredients: "sweet potatoes, quinoa, black beans, coriander, onion, oats", total_time: 80, user_id: 3, photo:f35)
#   f35.close
#   RecipeCategory.create(recipe_id: r35.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r35.id, category_id: c14.id)
#   RecipeCategory.create(recipe_id: r35.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r35.id, category_id: c16.id)
#   
#   f36 = File.open(Rails.root.join('photos/r36.jpeg').to_s)  
#   r36 = Recipe.create(title: "roasted tofu kale tacos", blog_url: "http://veganyackattack.com/2013/10/04/roasted-tofu-kale-tacos/", description: "Simple and healthy roasted tofu kale tacos, with homemade tortillas!", ingredients: "firm tofu, chili powder, cumin, white onion, bell pepper, kale, avocado", total_time: 60, user_id: 3, photo: f36)
#   f36.close
#   RecipeCategory.create(recipe_id: r36.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r36.id, category_id: c18.id)
#   RecipeCategory.create(recipe_id: r36.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r36.id, category_id: c16.id)
#   
#   f37 = File.open(Rails.root.join('photos/r37.jpeg').to_s)  
#   r37 = Recipe.create(title: "bbq tempeh sandwich", blog_url: "http://www.cookbookaficionado.com/brown-baggin-it-bbq-tempeh-sandwich/", description: "Vegan BBQ Tempeh Sandwich", ingredients: "tempeh, bbq sauce, vegan mayo, chipotle powder, dijon mustard, red onion, arugula", total_time: 40, user_id: 3, photo: f37)
#   f37.close
#   RecipeCategory.create(recipe_id: r37.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r37.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r37.id, category_id: c16.id)
#   
#   f38 = File.open(Rails.root.join('photos/r38.jpg').to_s)
#   r38 = Recipe.create(title: "1-hour chocolate & cinnamon-sugar pretzel bites", blog_url: "http://www.averiecooks.com/2014/01/one-hour-chocolate-and-cinnamon-sugar-soft-pretzel-bites.html", description: "1-Hour Chocolate & Cinnamon-Sugar Soft Pretzel Bites - You won't believe how fast & easy it is to DIY! Bread in 1 HOUR!", ingredients: "flour, instant yeast, sugar, cocoa powder, cinnamon", total_time: 60, user_id: 3, photo: f38)
#   f38.close
#   RecipeCategory.create(recipe_id: r38.id, category_id: c5.id)
#   RecipeCategory.create(recipe_id: r38.id, category_id: c18.id)
#   
#   f39 = File.open(Rails.root.join('photos/r39.jpg').to_s)
#   r39 = Recipe.create(title: "spinach & wild mushroom lasagna", blog_url: "http://www.fettlevegan.com/4/post/2014/01/spinach-wild-mushroom-lasagna-with-basil-almond-cream.html", description: "Spinach & Wild Mushroom Lasagna with Basil Almond Cream", ingredients: "almonds, garlic, dijon mustard, nutritional yeast, basil, gluten-free lasagna, pasta sauce, onion, spinach, vegan cheese", total_time: 45, user_id: 3, photo: f39)
#   f39.close
#   RecipeCategory.create(recipe_id: r39.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r39.id, category_id: c8.id)
#   RecipeCategory.create(recipe_id: r39.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r39.id, category_id: c12.id)
#   
#   f40 = File.open(Rails.root.join('photos/r40.jpg').to_s) 
#   r40 = Recipe.create(title: "corned bean hash", blog_url: "http://www.fettlevegan.com/4/post/2013/01/corned-bean-hash.html", description: "Corned BEAN hash", ingredients: "sunflower oil, onion, kidney beans, potatoes, tahini, soy sauce", total_time: 35, user_id: 3, photo: f40)
#   f40.close
#   RecipeCategory.create(recipe_id: r40.id, category_id: c1.id)
#   RecipeCategory.create(recipe_id: r40.id, category_id: c8.id)
#   
#   f41 = File.open(Rails.root.join('photos/r41.jpg').to_s)
#   r41 = Recipe.create(title: "blueberry banana bread", blog_url: "http://noshandnourish.com/content/my-famous-blueberry-banana-bread-made-vegangf", description: "My famous Blueberry Banana Bread -- made vegan and gluten-free.", ingredients: "brown rice flour, baking powder, coconut sugar, almond milk, bananas, flax, blueberries", total_time: 85, user_id: 3, photo: f41)
#   f41.close
#   RecipeCategory.create(recipe_id: r41.id, category_id: c1.id)
#   RecipeCategory.create(recipe_id: r41.id, category_id: c5.id)
#   RecipeCategory.create(recipe_id: r41.id, category_id: c7.id)
#   RecipeCategory.create(recipe_id: r41.id, category_id: c18.id)
#   RecipeCategory.create(recipe_id: r41.id, category_id: c8.id)
#   
#   f42 = File.open(Rails.root.join('photos/r42.jpeg').to_s)
#   r42 = Recipe.create(title: "raw peppermint bark brownies", blog_url: "http://www.oatmealwithafork.com/2013/12/02/raw-peppermint-bark-brownies-vegan-paleo/", description: "Raw Peppermint Bark Brownies...two of my favorite treats in one HEALTHY Christmas-themed bar! Vegan and paleo.", ingredients: "pecans, oats, dates, cocoa powder, peppermint extract, coconut butter, maple syrup", total_time: 20, user_id: 3, photo: f42)
#   f42.close
#   RecipeCategory.create(recipe_id: r42.id, category_id: c5.id)
#   RecipeCategory.create(recipe_id: r42.id, category_id: c18.id)
#   
#   f43 = File.open(Rails.root.join('photos/r43.jpeg').to_s)
#   r43 = Recipe.create(title: "coconut dried fruit bread", blog_url: "http://roxanashomebaking.com/coconut-dried-fruit-bread-recipe/", description: "A simple, yet delicious quick bread packed with dried fruit and bursting with coconut flavor.", ingredients: "flax meal, vegan butter, coconut oil, vegan cream cheese, sugar, flour, baking powder, dried fruits", total_time: 70, user_id: 3, photo: f43)
#   f43.close
#   RecipeCategory.create(recipe_id: r43.id, category_id: c1.id)
#   RecipeCategory.create(recipe_id: r43.id, category_id: c5.id)
#   RecipeCategory.create(recipe_id: r43.id, category_id: c7.id)
#   RecipeCategory.create(recipe_id: r43.id, category_id: c18.id)
#   
#   f44 = File.open(Rails.root.join('photos/r44.jpeg').to_s)  
#   r44 = Recipe.create(title: "cranberry orange pancakes", blog_url: "http://veganyackattack.com/2013/11/30/cranberry-orange-pancakes/", description: "Use leftover cranberry sauce, or make your own citrus-y version, to top these fluffy, orange pancakes!", ingredients: "cranberries, orange juice, sugar, non-dairy milk, apple cider vinegar, whole wheat flour, vanilla", total_time: 35, user_id: 3, photo: f44)
#   f44.close
#   RecipeCategory.create(recipe_id: r44.id, category_id: c1.id)
#   RecipeCategory.create(recipe_id: r44.id, category_id: c7.id)
#   
#   f45 = File.open(Rails.root.join('photos/r45.jpeg').to_s)
#   r45 = Recipe.create(title: "roasted vegetable ratatouille", blog_url: "http://www.amuse-your-bouche.com/easy-roasted-vegetable-ratatouille-chickpeas/", description: "Easy roasted vegetable ratatouille with chickpeas (and a secret ingredient that adds heaps of flavour!)", ingredients: "courgette, pepper, mushrooms, onion, chickpeas, tomatoes, bail pesto", total_time: 105, user_id: 3, photo: f45)
#   f45.close
#   RecipeCategory.create(recipe_id: r45.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r45.id, category_id: c10.id)
#   
#   f46 = File.open(Rails.root.join('photos/r46.jpeg').to_s)  
#   r46 = Recipe.create(title: "red lentils & carrots coconut soup", blog_url: "http://theflexitarian.co.uk/recipe-items/red-lentils-carrots-coconut-soup/", description: "Red Lentils and Carrots Coconut Soup. Lovely orange glow with soft, smooth & creamy coconut milk.", ingredients: "red lentils, carrots, onion, garlic, curry powder, coriander, vegetable stock, coconut milk, lemon juice", total_time: 35, user_id: 3, photo: f46)
#   f46.close
#   RecipeCategory.create(recipe_id: r46.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r46.id, category_id: c8.id)
#   RecipeCategory.create(recipe_id: r46.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r46.id, category_id: c19.id)
#   
#   f47 = File.open(Rails.root.join('photos/r47.jpeg').to_s)  
#   r47 = Recipe.create(title: "crispy carrot & potato gnocchi", blog_url: "http://veganmiam.com/recipes/crispy-carrot-potato-gnocchi-with-walnut-pesto", description: "Crispy Carrot & Potato Gnocchi with Walnut Pesto, Sautéed Shiitake Mushrooms, Green Peas, Parsley, and Red Chili Flakes.", ingredients: "basil, walnuts, nutritional yeast, lemon juice, gnocchi, shiitake mushrooms, chili flakes, green peas", total_time: 25, user_id: 3, photo: f47)
#   f47.close
#   RecipeCategory.create(recipe_id: r47.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r47.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r47.id, category_id: c12.id)
#   
#   f48 = File.open(Rails.root.join('photos/r48.jpeg').to_s)  
#   r48 = Recipe.create(title: "teriyaki tempeh sriracha soba", blog_url: "http://www.veganricha.com/2013/05/teriyaki-tempeh-and-shiitake-mushrooms.html", description: "TERIYAKI TEMPEH AND SHIITAKE MUSHROOMS WITH SRIRACHA SOBA. VEGAN RECIPE. EASILY GLUTENFREE.", ingredients: "soy sauce, sugar, rice white vinegar, tempeh, mushrooms", total_time: 30, user_id: 3, photo: f48)
#   f48.close
#   RecipeCategory.create(recipe_id: r48.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r48.id, category_id: c10.id)
#   RecipeCategory.create(recipe_id: r48.id, category_id: c12.id)
#   
#   f49 = File.open(Rails.root.join('photos/r49.jpg').to_s)  
#   r49 = Recipe.create(title: "creamy vegan spinach jalapeno dip", blog_url: "http://forealslife.com/blog/creamy-vegan-spinach-jalapeno-dip", description: "Creamy Vegan Spinach Jalapeno Dip. Easy, healthy and delicious!", ingredients: "spinach, silken tofu, lemon juice, miso paste, garlic, jalapeno, nutritional yeast", total_time: 50, user_id: 3, photo: f49)
#   f49.close
#   RecipeCategory.create(recipe_id: r49.id, category_id: c8.id)
#   RecipeCategory.create(recipe_id: r49.id, category_id: c18.id)
#   
#   f50 = File.open(Rails.root.join('photos/r50.jpg').to_s)
#   r50 = Recipe.create(title: "hoppin john deep dish pie", blog_url: "http://www.veganricha.com/2013/12/black-eyed-peas-tofu-thyme-ricotta-deep.html", description: "Hoppin john style Black eyed Peas, Tofu Ricotta Deep dish Pizza.", ingredients: "black eyed peas, onion, tomato sauce, firm tofu, thyme, garlic powder", total_time: 50, user_id: 3, photo: f50)
#   f50.close
#   RecipeCategory.create(recipe_id: r50.id, category_id: c6.id)
#   RecipeCategory.create(recipe_id: r50.id, category_id: c10.id)
end