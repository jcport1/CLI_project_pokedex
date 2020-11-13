
class Cli

    def start

        puts "*-------------------------------------*"
        puts "\nWelcome to Pallet Town, Ash Ketchum!"
        puts "\n*-------------------------------------*"
        sleep(1)
        puts "\nMy name is Professor Oak"
        puts "\n*-------------------------------------*"
        API.grab_pokemons
        self.menu 
    
    end 

    def menu

        puts "\nWannna explore the pokedex?"

        sleep(1)
    
        puts "\nType 'yes' to continue or any other key to exit"

        user_input = gets.strip.downcase

        if user_input == "yes" || user_input == "y"

            puts "\nThe user's tale of grand adventure is about to unfold!"

            display_list_of_pokemons #call method 

            ask_user_for_pokemon_choice #call method 

            sleep(1)
            menu #call menu to return to menu options 

            #Also possible to have while loop instead 

        else 
            #end the program

            sleep(1)
            
            puts "\nOk...You have the ability to become a great Pokemon Professor someday!"
           
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

       
        puts "\nPokemon around the world wait for you. Enter a number for more info."

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

    def display_pokemon_details(pokemon)

        #display details
       puts pokemon.name
       sleep(1)
       puts pokemon.attribute  

       # puts pokemon.pokemon_data

   end 

end 