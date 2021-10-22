class Board
  def display_board(array)
    puts ""
    @array = array


    puts puts 
    puts "Voici votre arène de combat ! Soyez-en dignes"
    puts puts 
    
    puts "A #{@array[0..2].inspect}"
    puts "B #{@array[3..5].inspect}"
    puts "C #{@array[6..9].inspect}"
    puts puts

    puts "Tapez || 1: A1 || 2: A2 || 3: A3"
    puts "Tapez || 4: B1 || 5: B2 || 6: B3"
    puts "Tapez || 7: C1 || 8: C2 || 9: C3" 
  end

  def display_counter(player_1, player_2, sign, player_1_score, player_2_score)
    puts "SCORE" 
    puts "#{player_1.name}: #{player_1_score} |||| #{player_2.name}: #{player_2_score}"
  end
 

end