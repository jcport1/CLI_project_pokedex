require 'pry'
class Cli

    def start

        puts "\n*-------------------------------------*"
        puts "\nWelcome to Pallet Town, Ash Ketchum!"
        puts "\n*-------------------------------------*"
        sleep(1)
        puts "\nMy name is Professor Oak."
        self.menu 
    
    end 

    def menu
        
        sleep(1)
        puts "\nI hear you came to learn more about pokemon. Would you like to explore the pokedex?"
        sleep(1)
        puts "\nType 'yes' to continue or any other key to exit"
        user_input = gets.strip.downcase

        if user_input == "yes" || user_input == "y"
            self.prompt_user
        else 
            #end the program
            sleep(1)
            puts "\nOk...You have the ability to become a great Pokemon Professor someday!"
            puts "\n"
        end 
    end 

    def prompt_user 
        
        puts "\nI'm delighted to hear that! Your grand adventure is about to unfold!"
        puts "\n"
        self.display_list_of_pokemons #call method 
        self.ask_user_for_pokemon_choice #call method 
        sleep(1)
        self.menu #call menu to return to menu options 
        #also possible to have while loop instead 
       
    end 


    def display_list_of_pokemons

        #access all the pokemon
        #print each one out
        API.grab_pokemons
        Pokemon.all.each.with_index(1) do |pokemon, index|
            puts "#{index}. #{pokemon.name}" 
        end 

    end 

    def ask_user_for_pokemon_choice

        puts "\nPokemon around the world wait for you! Enter a number for more info."
        pokemon_choice_index = gets.strip.to_i - 1 #ask for user input
        max_limit = Pokemon.all.length - 1


        until pokemon_choice_index.between?(0,max_limit)
            puts "Erm, sorry that's not a valid choice"
            pokemon_choice_index = gets.strip.to_i - 1 #re-ask for user input if invalid
        end 

        #user chose pokemon
        pokemon_object_lookup = Pokemon.all[pokemon_choice_index]
        #instead call the method that will print out the details
        #puts pokemon_instance.name 
        puts "Great choice! Here ya go:"
        sleep (2)
        puts "\n"
        API.pokemon_info(pokemon_object_lookup) 
        self.display_pokemon_info(pokemon_object_lookup)
    end 

    def display_pokemon_info(pokemon_object_lookup)

        #display details
        puts "\nName: #{pokemon_object_lookup.name}"
        sleep(1)
        puts "\nHeight: #{pokemon_object_lookup.height} decimetres"
        puts "\nWeight: #{pokemon_object_lookup.weight} hectograms"
        puts "\nMain Ability: #{pokemon_object_lookup.abilities}"
       # puts pokemon.pokemon_data
     end 

end 