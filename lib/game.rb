require "pry"
require "erb"
require "yaml"
require_relative "../classes.rb"

# FUNCTIONS

def save_game
    # create a new file
    # use binding to add current game state to file
    # store it in 'saves' directory with #
    # maybe increment number as a class object @@
end

lines = (File.readlines"../vendors/5desk.txt").map{|line| line.gsub("\r\n", "")}.select{|line| line.length >= 5 && line.length <= 12}
word = lines.sample.upcase

puts lines

corpse = Corpse.new()
binding.pry
corpse.corpse_update
corpse.corpse_display
binding.pry
Game.new(word).play

#binding pry
