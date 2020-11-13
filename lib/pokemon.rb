class Pokemon

    attr_accessor :name, :url, :height, :weight, :abilities #other important attributes

    @@all = []

    def initialize(name:, url:)

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