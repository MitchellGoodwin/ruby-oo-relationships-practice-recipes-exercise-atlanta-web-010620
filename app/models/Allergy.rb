class Allergy
    attr_reader :user, :ingredient
    @@all = []

    def initialize(user, ingredient)
        @user = user
        @ingredient = ingredient
        @@all << self
    end

    def self.ingredients
        self.all.map{|allergy| allergy.ingredient}
    end

    def self.all
        @@all
    end
end