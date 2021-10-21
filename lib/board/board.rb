# tableau en paramètre avec si les trucs ont été écris ou non 
# trois modèles ascii vide / plein rond / plein croix
# player1_name = "Mosché"
# player1 = Player.new(player1_name, "X")
# puts "MOSCHE #{player1_name}"




class Board
  def display_board(array)
    @array = array
    puts puts 
    puts "Voici votre arène de combat ! Soyez-en dignes"
    puts puts 
    
    puts "A #{@array[0..2].inspect}"
    puts "B #{@array[3..5].inspect}"
    puts "C #{@array[6..9].inspect}"
   
    puts puts

    puts "Taper || 1: A1 || 2: A2 || 3: A3"
    puts "Taper || 4: B1 || 5: B2 || 6: B3"
    puts "Taper || 7: B1 || 8: B2 || 9: B3" 
  end
end