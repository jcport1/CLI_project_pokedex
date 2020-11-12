class Cli

    def start

        puts "*--------------------*"
        puts "Welcome to Pallet Town, Ash Ketchum!"
        puts "*---------------------*"
        puts "My name is Professor Oak"
        puts "*---------------------*"
        API.grab_pokemons
        self.menu 
    
    end 

    def menu

        puts "Wannna explore the pokedex?"
        puts "*---------------------*"
        puts "Type 'yes' to continue or any other key to exit"
        user_input = gets.strip.downcase
        if user_input == "yes" || user_input == "y"
            puts "The user's tale of grand adventure is about to unfold!"
            display_list_of_pokemons
            ask_user_for_pokemon_choice
        else 
            #end the program
            puts "Ok...You have the ability to become a great Pokemon Professor someday!"
        end 

    end 

    def display_list_of_pokemons

        #access all the pokemon
        #print each one out
        Pokemon.all.each.with_index(1) do |pokemon, index|
            puts "#{index}. #{pokemon.name}" 
        end 

    end 

    def ask_user_for_pokemon_choice

        puts "*---------------------*"
        puts "Pokemon around the world wait for you. Choose a number for more info."
        index = gets.strip.to_i -1
        pokemon_instance = Pokemon.all[index]
        puts pokemon_instance 

    end 

end 