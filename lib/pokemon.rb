class Pokemon

    attr_accessor :name, :pokemon_data

    @@all = []

    def initialize(name:, pokemon_data:)

        @name = name
        @pokemon_data = pokemon_data
        @@all << self

    end 

    def self.all
        @@all
    end 


end 