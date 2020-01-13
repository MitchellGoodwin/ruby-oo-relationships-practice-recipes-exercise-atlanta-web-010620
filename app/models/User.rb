class User
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def recipes
        RecipeCard.all.select{|recipe_card| recipe_card.user == self}.map{|recipe_card| recipe_card.recipe}
    end

    def add_recipe_card(recipe, date, rating)
        RecipeCard.new(recipe, date, rating, self)
    end

    def declare_allergy(ingredient)
        Allergy.new(self, ingredient)
    end

    def allergies
        Allergy.all.select{|allergy| allergy.user == self}
    end
    
    def allergens
        self.allergies.map{|allergy| allergy.ingredient}
    end

    def top_three_recipes
        RecipeCard.all.select{|recipe_card| recipe_card.user == self}.sort_by{|recipe| recipe.rating}.reverse[0..2].map{|recipe_card| recipe_card.recipe}
    end

    def most_recent_recipe
        self.recipes.last
    end

    def safe_recipes
        Recipe.all.select{|recipe| (recipe.ingredients & self.allergens).empty?}
    end
end