require 'bundler'

Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'board/board'
require 'players/player'
require 'scripts/scripts'

players_array = ["1", "2", "3" ,"4", "5", "6", "7", "8", "9"]
forbidden_index = []

def perform(players_array, forbidden_index)
  board = Board.new
  scripting = Scripts.new

  array_copy = ["1", "2", "3" ,"4", "5", "6", "7", "8", "9"]  
  # scripting.welcome_everyone
  
  current_players = scripting.welcome_everyone
  player_1 = Player.new(current_players[0], "O")
  player_2 = Player.new(current_players[1], "X")
  puts board.display_board(players_array)

  print "Votre décision ? > "
  decision =  gets.chomp.to_i
  players_array[decision - 1] = player_1.sign
  forbidden_index = forbidden_index.push(decision).sort
  puts "forbidden_index #{forbidden_index}"
  
  
  
  if forbidden_index.count == players_array.count
    puts scripting.all_slot_filled
    sleep(2)
    perform(array_copy, forbidden_index)
  end

  case scripting.winning_output(players_array)
    when false
      # puts "c'est false"
      perform(players_array, forbidden_index)
    when true
      # puts "c'est true"
      forbidden_index = []
      perform(array_copy, forbidden_index)
  end 
end


perform(players_array, forbidden_index)