require 'pry'
class Cli

    def start
        
        puts "\n*-------------------------------------*"
        puts "\nWelcome to Pallet Town, Ash Ketchum!"
        puts "\n*-------------------------------------*"
        sleep(1)
        puts "\nMy name is Professor Oak."
        puts "\n*-------------------------------------*"
        sleep(1)
        puts "\nI hear you want to learn more about pokemon."
        puts "\n*-------------------------------------*"
        sleep(1)
        puts "\n Well, you came to the right place!"
        puts "\n*-------------------------------------*"
        API.grab_pokemons
        self.menu 
    
    end 

    def menu
        
        sleep(2)
        puts "\n"
        puts "Would you like to explore the pokedex?"
        puts "Type 'yes' to continue or any other key to exit"
        puts "\n"
        user_input = gets.strip.downcase

        if user_input == "yes" || user_input == "y"
            self.prompt_user
            sleep(3)
            self.display_list_of_pokemons #call method 
            self.ask_user_for_pokemon_choice #call method
            puts "\n*-------------------------------------*"
            puts "\nHm, that was a pretty long list."
            self.find_by_name 
            sleep(2)
            puts "\n*-------------------------------------*"
            puts "\nFascinating...You're on your way to becoming a pokemon master!"
        else 
            #end the program
            sleep(2)
            puts "\nOk...You have the ability to become a great Pokemon Professor someday!"
            puts "\n"
            exit 
        end 
        
        self.menu_navigation

    end 

    def prompt_user 
        
        puts "\nI'm delighted to hear that!"
        puts "\n"
        sleep(1)
        puts "\nLet's pull up all the pokemon to start"
        # self.menu #call menu to return to menu options 
        #also possible to have while loop instead 
    end 

    def menu_navigation
        
        puts "\nEnter search to look up a pokemon, 'pokedex' to see all pokemon again, or exit to close program"
        menu_choice = gets.strip

        if menu_choice == "search" 
            self.find_by_name
        elsif menu_choice == "pokedex"
            self.display_list_of_pokemons
            self.ask_user_for_pokemon_choice
        elsif menu_choice == "exit"
            exit  
        else
            puts "\nErm, sorry that's not a valid choice"
            menu_choice = gets.strip 
        end 
        
        menu_navigation 
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
        puts "\n"
        pokemon_choice_index = gets.strip.to_i - 1 #ask for user input
        max_limit = Pokemon.all.length - 1


        until pokemon_choice_index.between?(0,max_limit)
            puts "\nErm, sorry that's not a valid choice"
            pokemon_choice_index = gets.strip.to_i - 1 #re-ask for user input if invalid
        end 

        #user chose pokemon
        pokemon_object_lookup = Pokemon.all[pokemon_choice_index]
        #instead call the method that will print out the details
        #puts pokemon_instance.name
        puts "\n"
        puts "Great choice! Here ya go:"
        sleep (1)
        puts "\n"
        API.pokemon_info(pokemon_object_lookup) 
        self.display_pokemon_info(pokemon_object_lookup)
    end 

    def find_by_name

        puts "\n"
        puts "Let's search by name instead" #or pull up the list again
        puts "Enter the pokemon's name for more info"
        puts "\n"
        # puts "\n"
        pokemon_name_choice = gets.strip
         
        #if pokemon name is valid 

        if pokemon_name_choice = Pokemon.find_by_name(pokemon_name_choice)
            #pokemon_object_by_name = Pokemon.find_by_name(pokemon_name_choice)
            API.pokemon_info(pokemon_name_choice)
            # binding.pry 
            self.display_pokemon_info(pokemon_name_choice)
        else 
            puts "Erm, sorry that's not a valid choice"
            pokemon_name_choice = gets.strip #re-ask for user input if invalid
        end 
    end 

    def display_pokemon_info(pokemon_object_lookup)

        #display details
        puts "\nName: #{pokemon_object_lookup.name}"
        sleep(1)
        puts "\nType: #{pokemon_object_lookup.type}"
        puts "\nHeight: #{pokemon_object_lookup.height} decimetres"
        puts "\nWeight: #{pokemon_object_lookup.weight} hectograms"
        puts "\nMain Ability: #{pokemon_object_lookup.abilities}"
        
     end 

    #  def logo

       
    #     puts ""

    #  end 

end 