class Cli

    def start
        puts "*--------------------*"
        puts "Welcome to Pallet Town, Ash Ketchum!"
        puts "*---------------------*"
        puts "My name is Professor Oak"
        puts "*---------------------*"
        self.menu 
    
    end 

    def menu
        puts "Wannna explore the pokedex?"
        puts "*---------------------*"
        puts "Type 'yes' to continue or any other key to exit"
        user_input = gets.strip.downcase
        if user_input == "yes" || user_input == "y"
            puts "The user's tale of grand adventure is about to unfold!"
        else 
            #end the program
            puts "Ok...You have the ability to become a great Pokemon Professor someday!"
        end 

    end 

end 