class Pokemon

    attr_accessor :name, :url, :height, :weight, :abilities, :type #other important attributes

    @@all = []

    def initialize(name:, url:)

        @name = name
        @url = url 
        @height = height
        @weight = weight
        @abilities = abilities
        @type = type 
        @@all << self

    end 

    def self.all
        @@all
    end 

    def self.find_by_name(pokemon_choice)

        self.all.find {|pokemon| pokemon.name == pokemon_choice}

    end 




end 