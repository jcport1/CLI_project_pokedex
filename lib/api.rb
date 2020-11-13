require 'pry'
class API
    
    def self.grab_pokemons
     
        url = "https://pokeapi.co/api/v2/pokemon?limit=151"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        hash = JSON.parse(response)
        array_of_pokemons = hash["results"]

        array_of_pokemons.each do |pokemon|
           Pokemon.new(name: pokemon["name"], attribute: pokemon["url"])
           #iterating one more level to get the pokemon url info? 
        end 

        

    end 


    def self.grab_pokemon_info
     
        url = "https://pokeapi.co/api/v2/pokemon/#{pokemon.index}"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        pokemon_details = JSON.parse(response)

        pokemon.height = pokemon_details["height"]
        pokemon.weight = pokemon_details["weight"]
        pokemon.abilities = pokemon_details["abilities"][0]
       
    end 

end 