def deal_cards(deck, target)
  target.push(deck.keys.sample)
  deck[target[-1]][1] -= 1
  if deck[target[-1]][1] == 0
    deal_cards(deck, target)
  end
end

def calc_cards_value_dealer(deck, dealt_cards)
  sum = 0
  dealt_cards.each do |card|
    sum += deck[card][0]
  end
  sum
end

def calc_cards_value_player(deck, dealt_cards)
  sum = 0
  dealt_cards.each do |card|
    sum += deck[card][0]
  end
  if dealt_cards.include?("ace") && sum > 21
    sum -= 10
  end
  sum
end

def notify_player(dealt_cards, cards_total)
  dealt_cards.each do |card|
    index = dealt_cards.index(card). + 1
    puts index.to_s + ". #{card}"    
  end
  puts "Their total value is: #{cards_total}."
end

def declare_winner(cards_total)
  if cards_total == 21
    puts "You won!"
  elsif cards_total > 21
    puts "Unfortunately, you lost."
  end
end

cards = {"two" => [2, 4], "three" => [3, 4], "four" => [4, 4], "five" => [5, 4], "six" => [6, 4], "seven" => [7, 4], "eight" => [8, 4], 
          "nine" => [9, 4], "ten" => [10, 4], "jack" => [10, 4], "queen" => [10, 4], "king" => [10, 4], "ace" => [11, 4]}

choices = ["hit", "stay"]

player_cards = []
dealer_cards = []

puts "Welcome to the Blackjack game! What is your name?"
player_name = gets.chomp.capitalize
puts "Hi, #{player_name}! The dealer will start the game now.\n\n\n"

sleep(1)

player_total = 0
dealer_total = 0
winner = false
while !winner do
  deal_cards(cards, player_cards)
  deal_cards(cards, dealer_cards)
  deal_cards(cards, player_cards)
  deal_cards(cards, dealer_cards)
  player_total = calc_cards_value_player(cards, player_cards)
  puts "Your cards are:"
  notify_player(player_cards, player_total)
  declare_winner(player_total)
  if player_total >= 21
    winner = true
  end    
  while (player_total < 21) && (dealer_total < 21)
    player_choice = ""
    while (player_choice != "H") && (player_choice != "S") do
      puts "Would you like to hit or stay? (H/S)"
      player_choice = gets.chomp.upcase
    end
    if player_choice == "H"
      deal_cards(cards, player_cards)
      player_total = calc_cards_value_player(cards, player_cards)
      puts "Your cards are:"
      notify_player(player_cards, player_total)
      declare_winner(player_total)
      if player_total >= 21
        winner = true
      end
    elsif player_choice == "S"
      while dealer_total < 17
        deal_cards(cards, dealer_cards)
        dealer_total = calc_cards_value_dealer(cards, dealer_cards)
        puts "The dealer's cards are:"
        notify_player(dealer_cards, dealer_total)
        if dealer_total < 17
          puts "The total value of the dealer's cards is less than 17 so she will deal again.\n\n"
        end
        sleep (1)
      end
      if (dealer_total >= 17) && (dealer_total < 21)
        dealer_choice = choices.sample
        sleep(1)
        if dealer_choice == "hit"
          puts "\nThe dealer has decided to #{dealer_choice}."
          deal_cards(cards, dealer_cards)
          dealer_total = calc_cards_value_dealer(cards, dealer_cards)
          sleep(1)
          puts "\nThe dealer's cards are:"
          notify_player(dealer_cards, dealer_total)
          sleep(1)
          if dealer_total < 21
            dealer_choice = choices.sample
          end
        elsif dealer_choice == "stay"
          puts "\nThe dealer has decided to #{dealer_choice}."
          sleep (1)
          if dealer_total > player_total
            puts "\nUnfortunately, the total value of the dealer's cards is greater than yours and you've lost."
          else
            puts "\nThe value of your cards is greater than the value of the dealer's cards. You've won!"
          end
        end
      elsif dealer_total == 21
        puts "\nThe dealer has reached the value of 21. Unfortunately, you've lost." 
      elsif dealer_total > 21
        puts "\nThe value of the dealer's cards is greater than 21. You've won!"
      else
        puts "\nIt's a tie."
      end
      winner = true
    end
  end
end