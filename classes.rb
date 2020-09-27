class Game
    @@save_count = 0
    def initialize(word)
        @word = word
    end
    def play()
        arr = @word.scan(/\w/)
        p arr
    end
end


class Player
    @@pname = "chester"
    def print_name
        puts @@pname
    end
    # gets standard input from player (one char or 'save')
    # test each input char against Game.words
    # if it matches, add it to player_choices array
    # print @word as an array with _ replacing all letters not in player_choices
end

class Corpse

    def initialize
        @wrong_count = 0
        @corpse = %{
            _______
             |    |
                  |
                  |
                  |
           =======|
                 /-\\
          }
    end

    def get_wrong_count
        @wrong_count
    end
    
    def corpse_update
        @wrong_count += 1
        case @wrong_count
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
    end

    def corpse_display
        puts @corpse
    end
end