require 'pry'
require './lib/pig_dice'

game = PigDiceGame.new()
print "How many players will be in the game: "
num_player_str = gets.chomp
num_player = num_player_str.to_i
index = 1
until index > num_player
  print "Enter player #{index}'s name: "
  name = gets.chomp
  game.add_player(name)
  index += 1
end
game_end = ""
while game_end == ""
  player_turn = game.players[game.turn].name
  print "#{player_turn}, enter r to roll or h to hold: "
  player_move = gets.chomp
  is_one = false
  if player_move == "r"
    roll = game.continue()
    turn_points = game.turn_points
    print "#{player_turn}, you rolled a #{roll}. Your points for this turn are #{turn_points}.\n"
    is_one = (roll == 1)
  elsif player_move == "h"
    turn_points = game.turn_points
    player_points = game.players[game.turn].points + turn_points
    game_end = game.hold()
    print "#{player_turn}, you held with #{turn_points} points.  Your total is #{player_points}.\n"
  end
  if is_one
    new_player = game.players[game.turn].name
    print "Your turn is over! #{new_player}, it's your turn!\n"
  end
end
print "Congratulations! You won the game!\n"
