class Recipe

    @@all = []
    def initialize

        @@all << self
    end

    def self.most_popular
        recipe_user_amount = {}
        Recipe.all.each{|recipe| recipe_user_amount[recipe] = recipe.users.size}
        recipe_user_amount.select {|recipe, user_amount| user_amount == recipe_user_amount.values.max}.keys[0]
    end

    def self.all
        @@all
    end

    def users
        RecipeCard.all.select{|recipe_card| recipe_card.recipe == self}.map{|recipe_card| recipe_card.user}
    end

    def ingredients
        RecipeIngredient.all.select{|recipe_ingredient| recipe_ingredient.recipe == self}.map{|recipe_ingredient| recipe_ingredient.ingredient}
    end

    def allergens
        self.ingredients.select{|ingredient| Allergy.ingredients.include?(ingredient)}
    end

    def add_ingredient(ingredient)
        RecipeIngredient.new(ingredient, self)
    end

    def add_ingredients(ingredients)
        ingredients.each{|ingredient| self.add_ingredient(ingredient)}
    end

end