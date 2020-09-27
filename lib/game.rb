require "pry"
require "erb"
require "yaml"
require_relative "../classes.rb"

lines = (File.readlines"../vendors/5desk.txt").map{|line| line.gsub("\r\n", "")}.select{|line| line.length >= 5 && line.length <= 12}
word = lines.sample.upcase.scan(/\w/)
player = Array.new(word.length, '_')
corpse = Corpse.new()

Game.new(word, player, corpse).start_screen