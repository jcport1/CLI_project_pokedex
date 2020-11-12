require 'pry'
class API
    
    def self.grab_pokemons
     
        url = "https://pokeapi.co/api/v2/pokemon?limit=151"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        array_of_pokemons = hash["results"]
        array_of_pokemons.each do |pokemon|
            binding.pry 
           Pokemon.new(pokemon["name"],pokemon["url"])
           #iterating one more level to get the pokemon url info? 
        end 

    end 

end 