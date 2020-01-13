require_relative '../config/environment.rb'
mitch = User.new
alvin = User.new
i1 = Ingredient.new
i2 = Ingredient.new
i3 = Ingredient.new
i4 = Ingredient.new
i5 = Ingredient.new
r1 = Recipe.new
r2 = Recipe.new
r3 = Recipe.new
r4 = Recipe.new
mitch.add_recipe_card(r1, "today", 3)
mitch.add_recipe_card(r2, "today", 5)
mitch.add_recipe_card(r3, "today", 2)
mitch.add_recipe_card(r4, "today", 7)
alvin.add_recipe_card(r1, "today", 6)
r1.add_ingredients([i1, i2, i4])
r2.add_ingredients([i2, i5])
r3.add_ingredients([i1, i3, i5])
mitch.declare_allergy(i2)
mitch.declare_allergy(i4)
alvin.declare_allergy(i2)



binding.pry
