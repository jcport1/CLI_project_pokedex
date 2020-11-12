class Cli

    def start
        puts "*--------------------*"
        puts "Welcome to Pallet town , Ash Ketchum!"
        puts "*---------------------*"
        puts "My name is Professor Oak"
        puts "Wannna explore the pokedex? Y or N"
        @input = gets.strip.downcase
        # API.grab_pokemons
    end 


end 