class Pokemon

    attr_accessor :name, :index

    @@all = []

    def initialize(name:, index:)

        @name = name
        @url = url 
        @@all << self

    end 

    def self.all
        @@all
    end 


end 