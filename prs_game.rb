# PAPER ROCK SCISSORS

puts "Play Paper-Rock-Scissors!"

def game()
  # prompt player to enter their choice
  puts "Please enter 'P', 'R' or 'S' to choose between paper, rock and scissors."
  player_choice = gets.chomp.upcase 

  # check player input; if ok, continue game, if not, restart game
  if !((player_choice == "P") || (player_choice == "R") || (player_choice == "S"))
    game()
  else
    # generate computer choice
    choices = ["P", "R", "S"]
    comp_choice = choices.sample

    # compare choices and declare result: tie, user wins, computer wins
    if (player_choice == "P" && comp_choice == "P") || (player_choice == "R" && comp_choice == "R") || (player_choice == "S" && comp_choice == "S")
      result = "tie"
    elsif (player_choice == "P" && comp_choice == "R") || (player_choice == "R" && comp_choice == "S") || (player_choice == "S" && comp_choice == "P")
      result = "player wins"
    elsif (player_choice == "P" && comp_choice == "S") || (player_choice == "R" && comp_choice == "P") || (player_choice == "S" && comp_choice == "R")
      result = "computer wins"
    end

    # match complete word with player and computer choices for later messages
    if player_choice == "P"
      player_choice_full = "Paper"
    elsif player_choice == "R"
      player_choice_full = "Rock"
    elsif player_choice == "S"
      player_choice_full = "Scissors"
    end
      if comp_choice == "P"
      comp_choice_full = "Paper"
    elsif comp_choice == "R"
      comp_choice_full = "Rock"
    elsif comp_choice == "S"
      comp_choice_full = "Scissors"
    end
    
    # notify user of game choices and the result
    puts "You picked #{player_choice_full} and the computer picked #{comp_choice_full}."
    
    if result == "tie"
      puts "It's a tie."
    elsif result == "computer wins"
      puts "Computer won!"
    elsif result == "player wins"
      puts "You won!"
    end
  end

  # ask user whether to continue playing
  # if yes, restart the game
  # if not, stop the game  
  x = false
  while x == false
    puts "Play again? (Y/N)"
    game_cont = gets.chomp.upcase
    if game_cont == "Y"
      x = true
      game()
    elsif game_cont == "N"
      x = true
    else 
      x = false
    end
  end
end

game()