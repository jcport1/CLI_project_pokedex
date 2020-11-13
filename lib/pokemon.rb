class Pokemon

    attr_accessor :name, :index, :height, :weight, :abilities #other important attributes

    @@all = []

    def initialize(name:, index:)

        @name = name
        @index = index
        @height = height
        @weight = weight
        @abilities = abilities 
        @@all << self

    end 

    def self.all
        @@all
    end 


end 