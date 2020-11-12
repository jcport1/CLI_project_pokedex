class CLI

    def start
    
        puts "*--------------------*"
        puts "Welcome to my , Ash Ketchum!"
        puts "*---------------------*"
        puts "My name is professor Oak"
        puts "Wannna explore the pokedex? Y or N"
        @input = gets.strip.downcase
        API.grab_pokemons
    end 


end 