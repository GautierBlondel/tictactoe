require 'bundler'

Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'board/board'
require 'players/player'
require 'scripts/scripts'

players_array = ["1", "2", "3" ,"4", "5", "6", "7", "8", "9"]
player_1_score = 0
player_2_score = 0
forbidden_index = []

def perform(players_array, forbidden_index, player_1_score, player_2_score)
  scripting = Scripts.new
  current_players = scripting.welcome_everyone
  first_player = scripting.first_player

  puts scripting.single_turn(current_players, first_player,forbidden_index, players_array, player_1_score, player_2_score)

end


perform(players_array, forbidden_index, player_1_score, player_2_score)