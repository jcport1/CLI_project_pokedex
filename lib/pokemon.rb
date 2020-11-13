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


end 