class Scripts

  def welcome_everyone
      puts "Bienvenue à nos deux challengers, aujourd'hui je vous présente !!!"
      puts "A ma droite nous avons..."
      player1_name = gets.chomp
    
      puts "Et à ma gauche nous avons"
      player2_name = gets.chomp
      puts "Voici donc nos deux challengers #{player1_name} et #{player2_name}" 
  
      return [player1_name, player2_name]
    end

  def first_player
    first_player = ["X","O"][rand(0..1)]
    return first_player
  end

  def all_slot_filled
    puts "Aucun challenger n'a tiré son épingle du jeu !"
    puts "On y retourne"
  end


  def winning_output(array)
    line_1_round = array[0..2].all? {|item| item == "O"} 
    line_2_round = array[3..5].all?{|item| item == "O"} 
    line_3_round = array[6..9].all?{|item| item == "O"} 
    column_1_round = [array[0],array[3],array[6]].all?{|item| item == "O"} 
    column_2_round = [array[1],array[4],array[7]].all?{|item| item == "O"} 
    column_3_round = [array[2],array[5],array[8]].all?{|item| item == "O"} 
    diagonal_1_round = [array[0],array[4],array[8]].all?{|item| item == "O"} 
    diagonal_2_round = [array[2],array[4],array[6]].all?{|item| item == "O"}
    line_1_cross = array[0..2].all? {|item| item == "X"} 
    line_2_cross = array[3..5].all?{|item| item == "X"} 
    line_3_cross = array[6..9].all?{|item| item == "X"} 
    column_1_cross = [array[0],array[3],array[6]].all?{|item| item == "X"} 
    column_2_cross = [array[1],array[4],array[7]].all?{|item| item == "X"} 
    column_3_cross = [array[2],array[5],array[8]].all?{|item| item == "X"} 
    diagonal_1_cross = [array[0],array[4],array[8]].all?{|item| item == "X"} 
    diagonal_2_cross = [array[2],array[4],array[6]].all?{|item| item == "X"}  

    if line_1_round || line_1_cross || line_2_round || line_2_cross || line_3_round || line_3_cross || column_1_round || column_1_cross || column_2_round || column_2_cross || column_3_round || column_3_cross || diagonal_1_round || diagonal_1_cross || diagonal_2_round || diagonal_2_cross
      return true
    else return false
    end  
  end

  def single_turn(current_players, first_player, forbidden_index, players_array, player_1_score, player_2_score)
    board = Board.new

    array_copy = ["1", "2", "3" ,"4", "5", "6", "7", "8", "9"]
    player_1 = Player.new(current_players[0], "O")
    player_2 = Player.new(current_players[1], "X")
    current_player = player_1.sign == first_player ? player_1 : player_2
    puts board.display_board(players_array)
    print "Votre décision ? > "
    decision =  gets.chomp.to_i
    forbidden_index = forbidden_index.push(decision) 
    players_array[decision - 1] = current_player.sign


    if forbidden_index.count == players_array.count
      puts scripting.all_slot_filled
      system("clear")
      single_turn(current_players, next_sign, forbidden_index, players_array, player_1_score, player_2_score)
    end
  
    case self.winning_output(players_array)
      when false
        puts "c'est false"
        next_sign = first_player == "X" ? "O" : "X"
        
        single_turn(current_players, next_sign, forbidden_index, players_array, player_1_score, player_2_score)
      when true
        system("clear")
        puts "#{current_player.name} a gagné"
        if current_player.sign == "O"
          player_1_score = player_1_score + 1
        elsif current_player.sign == "X"
          player_2_score = player_2_score + 1
        end
        forbidden_index = []
        board.display_counter(player_1, player_2, current_player.sign, player_1_score, player_2_score)
        single_turn(current_players, first_player, forbidden_index, array_copy, player_1_score, player_2_score)
    
    end 
  end
  

end 