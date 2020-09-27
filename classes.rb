class Game

    def initialize(word, player, corpse)
        @word = word
        @player = player
        @corpse = corpse
        @wrong_count = 0 
        @game_over = false
        @@save_count = File.open("../saves/log.yml", "r").read.to_i
    end

    # Use a file to store the number of saves we have. This is used to create a selectable set of saved games.
    def log_saves   
        s_log = File.open("../saves/log.yml", "w")
        s_log.puts @@save_count
        s_log.close
    end

    # Save the game, and increment the number of saved games.
    def save_game
        Dir.mkdir("../saves") unless Dir.exists?("../saves")
        @@save_count += 1
        binding.pry
        log_saves
        savefile = "../saves/save_#{@@save_count}.yml"
        File.open(savefile, 'w') do | file |
            file.write(self.to_yaml)
        end
    end

    # Select a saved game from 1 - (number of saved games) and load it.
    def load_game
        file = File.open("../saves/log.yml", "r")
        s_log = file.read.to_i
        file.close
        if s_log == 0
            puts "No save data."
        else
            puts "Select a save file (1 to #{s_log})."
            s_choice = gets.chomp.to_i
            if s_choice <= s_log
                puts "Loading save game # #{s_choice}..."
                game_state = YAML.load(File.read("../saves/save_#{s_choice}.yml"))
                game_state.play
            else
                puts "Selected save file does not exist."
            end
        end
    end
    
    # Check for victory or defeat at the end of each game loop iteration.
    def victory_check
        if @word == @player
            @game_over = true
            puts "Victory!"
        elsif @wrong_count >= 5
            @game_over = true
            puts "Defeat!"
            puts "The word was: '#{@word.join('')}'"
        end
    end


    # Test each input char against the mysterious @word array.
    # If the char is in there, add it to the @player array at same position it is found in the word.
    # If not, increment @wrong_count and show @corpse.display.
    def letter_match(player_input)
        if !@word.include?(player_input)
            @wrong_count += 1
            @corpse.display(@wrong_count)
        else
            @word.each_with_index do | letter, index |
                if letter == player_input
                    @player[index] = player_input
                end
            end
            p @player
        end
    end

    # We begin with a start screen to determine if the player will start a new game, or load a saved state.
    def start_screen()
        puts "Welcome to Hangman."
        puts "'N' to start a new game, 'L' to load!"
        choice = gets.chomp.upcase
        if choice == 'N'
            self.play
        elsif choice == 'L'
            load_game
        else
            puts "Please choose 'N' or 'L' next time."
            puts "For now the culprit's fate is spared. Take care!"
        end
    end


    def play()
        p @player
        while @game_over == false
            puts '------------'
            puts 'Try a letter:'
            player_input = gets.chomp.upcase
            if player_input == "SAVE"
                    save_game
                    @game_over = true
            elsif player_input == "EXIT"
                break
            else
                player_input = player_input.split(//)[0]
                letter_match(player_input)
            end
            victory_check
        end
    end  
end

class Corpse
    def initialize
        @wrong_count = 0
        @corpse = ""
    end
    
    def display(wrong)
        case wrong
        when 0
            @corpse = "
             _______
              |    |
                   |
                   |
                   |
            =======|
                  /-\\
              "
        when 1
            @corpse = "
                _______
                 |    |
                 0    |
                      |
                      |
               =======|
                     /-\\
                     "
        when 2
            @corpse = "
                _______
                 |    |
                 0    |
                 |    |
                      |
               =======|
                     /-\\
                     "
        when 3
            @corpse = "
                _______
                 |    |
                 0    |
               --|--  |
                      |
               =======|
                     /-\\
                     "
        when 4
            @corpse = "
                _______
                 |    |
                 0    |
               --|--  |
                / \\   |
               =======|
                     /-\\
                     "
        when 5
            @corpse = "
                _______
                 |    |
                 |    |
                \\0/   |
                 |    |
               = | ===|
                     /-\\
               GAME OVER
                     "
        else
            "Error: wrong_count overload"
        end
    puts @corpse
    end
end
