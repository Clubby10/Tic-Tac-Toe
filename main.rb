# Define the board as a 3x3 array
board = [
  [" ", " ", " "],
  [" ", " ", " "],
  [" ", " ", " "]
]

# Define a method to display the board
def display_board(board)
  puts " #{board[0][0]} | #{board[0][1]} | #{board[0][2]} "
  puts "---+---+---"
  puts " #{board[1][0]} | #{board[1][1]} | #{board[1][2]} "
  puts "---+---+---"
  puts " #{board[2][0]} | #{board[2][1]} | #{board[2][2]} "
end

# Define a method to check if there is a winner
def winner?(board)
  # Check rows
  board.each do |row|
    return true if row.uniq.length == 1 && row[0] != " "
  end

  # Check columns
  board.transpose.each do |column|
    return true if column.uniq.length == 1 && column[0] != " "
  end

  # Check diagonals
  diagonals = [[board[0][0], board[1][1], board[2][2]], [board[0][2], board[1][1], board[2][0]]]
  diagonals.each do |diagonal|
    return true if diagonal.uniq.length == 1 && diagonal[0] != " "
  end

  # If no winner is found, return false
  return false
end

# Define a method to check if the board is full
def full?(board)
  board.each do |row|
    return false if row.include?(" ")
  end
  return true
end

# Define a method to get a player's move
def get_move(board, player)
  loop do
    print "#{player}, enter your move (row col): "
    move = gets.chomp.split.map(&:to_i)
    row, col = move[0], move[1]

    if row.between?(1, 3) && col.between?(1, 3) && board[row-1][col-1] == " "
      board[row-1][col-1] = player
      break
    else
      puts "Invalid move. Try again."
    end
  end
end

# Start the game loop
current_player = "X"
loop do
  # Display the board
  display_board(board)

  # Get the current player's move
  get_move(board, current_player)

  # Check for a winner or a tie
  if winner?(board)
    display_board(board)
    puts "#{current_player} wins!"
    break
  elsif full?(board)
    display_board(board)
    puts "Tie game!"
    break
  end

  # Switch players
  current_player = current_player == "X" ? "O" : "X"
end
