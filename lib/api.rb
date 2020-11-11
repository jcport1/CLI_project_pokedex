class API
    
    def self.grab_pokemons

        url = "https://pokeapi.co/api/v2/pokemon/"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        array_of_pokemons = hash[]
        array_of_pokemons.each do |pokemon|
        end 

    end 

end 