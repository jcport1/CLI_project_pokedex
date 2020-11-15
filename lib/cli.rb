require 'pry'
class Cli

    def start
        self.pika_logo
        sleep(2)
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
        puts "\nWell, you came to the right place!"
        puts "\n*-------------------------------------*"
        API.grab_pokemons
        self.menu 
    
    end 

    def menu
        
        sleep(2)
        puts "\n"
        puts "Would you like to explore the pokedex?".colorize(:blue)
        puts "Type 'yes' to continue or any other key to exit".colorize(:blue)
        puts "\n"
        user_input = gets.strip.downcase

        if user_input == "yes" || user_input == "y"
            self.prompt_user
            sleep(3)
            self.display_list_of_pokemons #call method 
            self.ask_user_for_pokemon_choice #call method
            puts "\n*-------------------------------------*"
            puts "\nThat's some really neat info!"
            puts "\n*-------------------------------------*"
            sleep(1)
            puts "\nHm, but the list of pokemon in the pokedex is pretty long."
            puts "\n*-------------------------------------*"
            sleep(2)
            self.find_by_name 
            sleep(2)
            puts "\n*-------------------------------------*"
            puts "\nSimply incredible."
            puts "\n*-------------------------------------*"
            sleep (1)
            puts "\nYou're on your way to becoming a pokemon master!"
            puts "\n*-------------------------------------*"
        else 
            #end the program
            sleep(2)
            puts "\n*-------------------------------------*"
            puts "\nAlright, sad to see you go."
            puts "\n*-------------------------------------*"
            sleep(2)
            puts "\nRemember, you have the ability to become a great Pokemon Professor someday!"
            puts "\n*-------------------------------------*"
            puts "\n"
            exit 
        end 
        
        sleep (2)
        puts "\nWhat's next?"
        puts "\n*-------------------------------------*"
        sleep(1)
        self.menu_navigation

    end 

    def prompt_user 

        puts "\n*-------------------------------------*"
        puts "\nI'm delighted to hear that!"
        puts "\n*-------------------------------------*"
        sleep(1)
        puts "\nOne sec while I power on the pokedex."
        puts "\n*-------------------------------------*"
        sleep(2)
        puts "\nAlright,let's pull up all the pokemon to start."
        puts "\n*-------------------------------------*"
        # self.menu #call menu to return to menu options 
        #also possible to have while loop instead 
    end 

    def menu_navigation #fix error message

        # puts "\n*-------------------------------------*"
        puts "\nEnter 'search' to look up a pokemon, 'pokedex' to see all pokemon again, or 'exit' to close program".colorize(:blue)
        puts "\n"
        menu_choice = gets.strip.downcase

        if menu_choice == "search"
            puts "\n*-------------------------------------*" 
            self.find_by_name
            sleep(1)
            puts "\n*-------------------------------------*"
            puts "\nWow, you're on your way to becoming an authority!"
            puts "\n*-------------------------------------*"
        elsif menu_choice == "pokedex"
            self.display_list_of_pokemons
            self.ask_user_for_pokemon_choice
            sleep(1)
            puts "\n*-------------------------------------*"
            puts "\nYou'll be an expert in no time!"
            puts "\n*-------------------------------------*"
        elsif menu_choice == "exit"
            sleep(2)
            puts "\n*-------------------------------------*"
            puts "\nAlright, sad to see you go."
            puts "\n*-------------------------------------*"
            sleep(2)
            puts "\nRemember, you have the ability to become a great Pokemon Professor someday!"
            puts "\n*-------------------------------------*"
            puts "\n"
            exit  
        else
            puts "\n*-------------------------------------*"
            puts "\nErm, sorry that's not a valid choice".colorize(:light_red)
            menu_choice = gets.strip.downcase 
        end 
        
        menu_navigation 
    end 

    def display_list_of_pokemons

        #access all the pokemon
        #print each one out
        puts "\n"
        Pokemon.all.each.with_index(1) do |pokemon, index|
            puts "#{index}. #{pokemon.name}".colorize(:light_magenta) 
        end 

    end 

    def ask_user_for_pokemon_choice

        puts "\n*-------------------------------------*"
        puts "\nSo many pokemon...impressive." 
        puts "\n*-------------------------------------*"
        sleep (1)
        puts "\nI'm always amazed by the abundance of pokemons!"
        puts "\n*-------------------------------------*"
        sleep (1)
        puts  "\nLet's choose a pokemon to research."
        puts "\n*-------------------------------------*"
        sleep (1)
        puts "\n"
        puts "\nEnter a pokemon number for more info.".colorize(:blue)
        puts "Scroll up to see full list.".colorize(:blue)
        puts "\n"
        pokemon_choice_index = gets.strip.to_i - 1 #ask for user input
        max_limit = Pokemon.all.length - 1


        until pokemon_choice_index.between?(0,max_limit)
            puts "\nErm, sorry that's not a valid choice".colorize(:light_red)
            pokemon_choice_index = gets.strip.to_i - 1 #re-ask for user input if invalid
        end 

        #user chose pokemon
        pokemon_object_lookup = Pokemon.all[pokemon_choice_index]
        #instead call the method that will print out the details
        #puts pokemon_instance.name
        sleep (2)
        puts "\n*-------------------------------------*"
        puts "\nGreat choice! Here ya go:"
        puts "\n*-------------------------------------*"
        sleep (1)
        API.pokemon_info(pokemon_object_lookup) 
        self.display_pokemon_info(pokemon_object_lookup)
    end 

    def find_by_name

        puts "\nLet's search by name..." #or pull up the list again
        puts "\n*-------------------------------------*"
        puts "\n"
        # sleep(1)
        puts "\nEnter the pokemon's name for more info".colorize(:blue)
        puts "\n"

        pokemon_name_choice = gets.strip.downcase
         
        #if pokemon name is valid 

        until pokemon_name_choice = Pokemon.find_by_name(pokemon_name_choice)
            puts "\nErm, sorry that's not a valid choice".colorize(:light_red)
            pokemon_name_choice = gets.strip.downcase #re-ask for user input if invalid
        end 

        API.pokemon_info(pokemon_name_choice)
        self.display_pokemon_info(pokemon_name_choice)
    end 

    def display_pokemon_info(pokemon_object_lookup)

        #display details
        puts "\nName: #{pokemon_object_lookup.name}".colorize(:cyan)
        sleep(1)
        puts "\nType: #{pokemon_object_lookup.type}".colorize(:cyan)
        sleep(1)
        puts "\nHeight: #{pokemon_object_lookup.height} decimetres".colorize(:cyan)
        sleep(1)
        puts "\nWeight: #{pokemon_object_lookup.weight} hectograms".colorize(:cyan)
        sleep(1)
        puts "\nMain Ability: #{pokemon_object_lookup.abilities}".colorize(:cyan)
        
     end 

     def pika_logo

        file = File.open("./lib/pika.txt")
        puts file.read.colorize(:light_magenta)

     end 

end 