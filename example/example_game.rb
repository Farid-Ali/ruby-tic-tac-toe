root = File.expand_path("../", File.dirname(__FILE__))
require "#{root}/lib/tic_tac_toe.rb"

puts "Welcome to tic tac toe"
bob = TicTacToe::Player.new({symbol: "X", name: "bob"})
frank = TicTacToe::Player.new({symbol: "O", name: "frank"})
players = [bob, frank]
TicTacToe::Game.new(players).play