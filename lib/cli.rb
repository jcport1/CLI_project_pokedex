
class Cli

    def start

        puts "\n*-------------------------------------*"
        puts "\nWelcome to Pallet Town, Ash Ketchum!"
        puts "\n*-------------------------------------*"
        sleep(2)
        puts "\nMy name is Professor Oak."
        API.grab_pokemons
        self.menu 
    
    end 

    def menu
        
        sleep(2)
        puts "\nI hear you came to learn more about pokemon. Would you like to explore the pokedex?"
        sleep(2)
        puts "\nType 'yes' to continue or any other key to exit"
        user_input = gets.strip.downcase
        if user_input == "yes" || user_input == "y"
            prompt_user
        else 
            #end the program
            sleep(2)
            puts "\nOk...You have the ability to become a great Pokemon Professor someday!"
            puts "\n"
    end 

    def prompt_user 
        
        puts "\nI'm delighted to hear that! Your grand adventure is about to unfold!"
        puts "\n"
        display_list_of_pokemons #call method 
        ask_user_for_pokemon_choice #call method 
        sleep(1)
        menu #call menu to return to menu options 
        #also possible to have while loop instead 
       
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

        puts "\nPokemon around the world wait for you! Enter a number for more info."
        pokemon = gets.strip.to_i - 1 #ask for user input
        max_limit = Pokemon.all.length - 1


        until index.between?(0,max_limit)
            puts "Erm, sorry that's not a valid choice"
            pokemon = gets.strip.to_i - 1 #re-ask for user input if invalid
        end 

        pokemon_instance = Pokemon.all[pokemon]
        #instead call the method that will print out the details
        #puts pokemon_instance.name 
        puts "Great choice! Here ya go:"

        sleep (2)
        puts "\n"
        Api.grab_pokemon_info(pokemon_instance)
        display_pokemon-info(pokemon_instance)
    end 

    def display_pokemon_info(pokemon_instance)
        
        #display details
        puts "\nName: #{pokemon.name}"
        sleep(1)
        puts "Height: #{pokemon.height}"
        puts "Weight: #{pokemon.weight}"
        puts "Abilities: #{pokemon.abilities}"
       # puts pokemon.pokemon_data
     end 
end 