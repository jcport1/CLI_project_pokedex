class Pokemon

    attr_accessor :name, :attribute, :height, :weight, :abilities #other important attributes

    @@all = []

    def initialize(name:, attribute:)

        @name = name
        @attribute = attribute
        @height = height
        @weight = weight
        @abilities = abilities 
        @@all << self

    end 

    def self.all
        @@all
    end 


end 