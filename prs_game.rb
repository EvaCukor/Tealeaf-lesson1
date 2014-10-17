# PAPER ROCK SCISSORS

require 'pry'

puts "Play Paper-Rock-Scissors!"

def game
  # prompt player to enter their choice
  puts "Please enter 'P', 'R' or 'S' to choose between paper, rock and scissors."
  player_choice = gets.chomp.upcase 

  # check player input; if ok, continue game, if not, restart game
  if !((player_choice == "P") || (player_choice == "R") || (player_choice == "S"))
    game
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
    # notify user of game choices and the result
    puts "You picked #{choice_full_word(player_choice)} and the computer picked #{choice_full_word(comp_choice)}."
    
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
  stop_playing = false
  unless stop_playing
    puts "Play again? (Y/N)"
    game_cont = gets.chomp.upcase
    if game_cont == "Y"
      game
    else
      stop_playing = true
    end
  end
end

def choice_full_word(letter)
  if letter == "P"
    full_word = "Paper"
  elsif letter == "R"
    full_word = "Rock"
  elsif letter == "S"
    full_word = "Scissors"
  end
  full_word  
end

game