class Scripts

  def welcome_everyone
      puts "Bienvenue à nos deux challengers, aujourd'hui je vous présente !!!"
      puts "A ma droite nous avons..."
      # player1_name = gets.chomp
      player1_name = "Corben"
      
    
      puts "Et à ma gauche nous avons"
      # player2_name = gets.chomp
      player2_name = "Richard"

      return [player1_name, player2_name]
    
      puts "Voici donc nos deux challengers #{player1_name} et #{player2_name}" 
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

end 