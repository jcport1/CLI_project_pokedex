class Pokemon

    attr_accessor :name, :attribute #other important attributes

    @@all = []

    def initialize(name:, attribute:)

        @name = name
        @attribute = attribute
        @@all << self

    end 

    def self.all
        @@all
    end 


end 