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
        puts "Pokemon around the world wait for you. Enter a number for more info."
        index = gets.strip.to_i - 1 #ask for user input
        max_limit = Pokemon.all.length - 1
        until index.between?(0,max_limit)
            puts "Erm, sorry that's not a valid choice"
            index = gets.strip.to_i - 1 #re-ask for user input if invalid
        end 

        pokemon_instance = Pokemon.all[index]
        #instead call the method that will print out the details
        #puts pokemon_instance.name 
        display_pokemon_details(pokemon_instance)

    end 

    def display_pokemon_details(pokemon_instance)

         #display details
        puts pokemon.name
        puts pokeman.pokeman_data 
    end 

end 