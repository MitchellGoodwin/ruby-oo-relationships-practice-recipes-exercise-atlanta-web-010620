class Ingredient
    @@all = []

    def initialize
        @@all << self
    end
    
    def self.all
        @@all
    end

    def users
        Allergy.all.select{|allergy| allergy.ingredient == self}.map{|allergy| allergy.user}
    end

    def self.most_common_allergen
        allergic_users_amount = {}
        Ingredient.all.each{|ingredient| allergic_users_amount[ingredient] = ingredient.users.size}
        allergic_users_amount.select {|ingredient, allergic_people| allergic_people == allergic_users_amount.values.max}.keys[0]
    end
end
