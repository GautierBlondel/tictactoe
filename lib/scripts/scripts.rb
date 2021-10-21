class Scripts

  def welcome_everyone
      puts "Bienvenue à nos deux challengers, aujourd'hui je vous présente !!!"
      puts "A ma droite nous avons..."
      # player1_name = gets.chomp
      player1_name = "Corben"
    
      puts "Et à ma gauche nous avons"
      # player2_name = gets.chomp
      player2_name = "Richard"
      puts "Voici donc nos deux challengers #{player1_name} et #{player2_name}" 
  
      return [player1_name, player2_name]
    end

  def first_player
    first_player = ["X","O"][rand(0..1)]
    puts "first_player #{first_player}"
    return first_player
  end

  def all_slot_filled
    puts "Aucun challenger n'a tiré son épingle du jeu !"
    puts "On y retourne"
  end

  def winning_output(array)
    line_1 = array[0..2].all?("O" || "X")
    line_2 = array[3..5].all?("O" || "X")
    line_3 = array[6..9].all?("O" || "X")
    column_1 = [array[0],array[3],array[6]].all?("O" || "X")
    column_2 = [array[1],array[4],array[7]].all?("O" || "X")
    column_3 = [array[2],array[5],array[8]].all?("O" || "X")
    diagonal_1 = [array[0],array[4],array[8]].all?("O" || "X")
    diagonal_2 = [array[2],array[4],array[6]].all?("O" || "X")

    if line_1 || line_2 || line_3 || column_1 || column_2 || column_3 || diagonal_1 || diagonal_2
      puts "Vous avez gagné"
      return true
    else return false
    end  
  end

  def single_turn(current_players, first_player, forbidden_index, players_array)
    board = Board.new
    player_1 = Player.new(current_players[0], "O")
    player_2 = Player.new(current_players[1], "X")
    current_player = player_1.sign == first_player ? player_1 : player_2
    puts "current_player #{current_player.name}" 
    puts board.display_board(players_array)
    print "Votre décision ? > "
    decision =  gets.chomp.to_i
    forbidden_index = forbidden_index.push(players_array[decision - 1]) 
    players_array[decision - 1] = current_player.sign
    puts "forbidden_index #{forbidden_index}"

    if forbidden_index.count == players_array.count
      puts scripting.all_slot_filled
      sleep(2)
      single_turn(current_players, first_player, forbidden_index, array_copy)
    end
  
    case self.winning_output(players_array)
      when false
        puts "c'est false"
        next_sign = first_player == "X" ? "O" : "X"
        
        single_turn(current_players, next_sign, forbidden_index, players_array)
      when true
        puts "c'est true"
        forbidden_index = []
        single_turn(current_players, first_player, forbidden_index, array_copy)
    
    end 
  end
  

end 