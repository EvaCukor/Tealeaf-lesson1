# TIC TAC TOE
def grid_init
  grid = {}
  (1..9).each {|position| grid[position] = " "}
  grid
end

def draw_grid(grid)
  puts "     |     |     "
  puts "  #{grid[1]}  |  #{grid[2]}  |  #{grid[3]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{grid[4]}  |  #{grid[5]}  |  #{grid[6]}  "
  puts "     |     |     "
  puts "-----+-----+-----"
  puts "     |     |     "
  puts "  #{grid[7]}  |  #{grid[8]}  |  #{grid[9]}  "
  puts "     |     |     "
end

def empty_positions(grid)
  grid.keys.select { |position| grid[position] == " "}
end

def player_picks(grid)
  player_choice = ""
  loop do
    puts "Pick a position by entering a number between 1 and 9:"
    player_choice = gets.chomp.to_i
    break if empty_positions(grid).include?(player_choice)
  end
  grid[player_choice] = "X"
end

def comp_picks(grid)
  comp_choice = empty_positions(grid).sample
  grid[comp_choice] = "O"
end

def check_winner(grid)
  winning_lines = [[1,2,3], [4,5,6], [7,8,9], [1,4,7], [2,5,8], [3,6,9], [1,5,9], [3,5,7]]
  winning_lines.each do |line|
    return "Player" if grid.values_at(*line).count("X") == 3
    return "Computer" if grid.values_at(*line).count("O") == 3
  end
  nil
end

grid = grid_init
draw_grid(grid)

begin 
  player_picks(grid)
  comp_picks(grid)
  draw_grid(grid)
  winner = check_winner(grid)
end until winner || (empty_positions(grid) == [])

if empty_positions(grid) == []
  puts "It's a tie!"
else
  puts "The winner is the #{winner}!"
end