INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'
WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # columns
                [[1, 5, 9], [3, 5, 7]]              # diagonals

def prompt(msg)
  puts "=> #{msg}"
end

# rubocop:disable Metrics/AbcSize
def display_board(board)
  system 'clear'
  puts "You're #{PLAYER_MARKER}. Computer is #{COMPUTER_MARKER}."
  puts " "
  puts "     |     |"
  puts "  #{board[1]}  |  #{board[2]}  |  #{board[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[4]}  |  #{board[5]}  |  #{board[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{board[7]}  |  #{board[8]}  |  #{board[9]}"
  puts "     |     |"
end
# rubocop:enable Metrics/AbcSize

def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(board)
  board.keys.select { |num| board[num] == INITIAL_MARKER }
end

def player_picks_first_player
  prompt 'Who should go first? You (y) or Computer (c)'
  first_player = gets.chomp.downcase
  loop do
    break if %w(you computer y c).include?(first_player)
    prompt "Please pick a valid answer.'y' for you and 'c' for computer"
    first_player = gets.chomp.downcase
  end

  return 'Player' if %w(you y).include?(first_player)
  'Computer'
end

def joinor(array, delimeter = ', ', word = 'or')
  case array.size
  when 0 then ' '
  when 1 then array.first.to_s
  when 2 then array.join(" #{word} ")
  else
    array.join(delimeter).insert(-2, "#{word} ")
  end
end

def place_piece!(board, current_player)
  if current_player == 'Player'
    player_places_piece!(board)
  else
    computer_places_piece!(board)
  end
end

def player_places_piece!(board)
  square = ''
  loop do
    prompt "Choose a square (#{joinor(empty_squares(board))}:)"
    square = gets.chomp.to_i
    break if empty_squares(board).include?(square)
    prompt "Sorry, that's not a valid choice."
  end

  board[square] = PLAYER_MARKER
end

def find_at_risk_square(board, marker)
  at_risk_square = []
  WINNING_LINES.each do |line|
    sum = board.values_at(*line).count(marker)
    if line.select { |num| board[num] == ' ' && sum == 2 }.size == 1
      at_risk_square = line.select { |num| board[num] == ' ' && sum == 2 }
    end
  end
  at_risk_square.first
end

def computer_places_piece!(board)
  winning_square = find_at_risk_square(board, COMPUTER_MARKER)
  risk_square = find_at_risk_square(board, PLAYER_MARKER)

  if winning_square
    board[winning_square] = COMPUTER_MARKER
  elsif risk_square
    board[risk_square] = COMPUTER_MARKER
  elsif board[5] == INITIAL_MARKER
    board[5] = COMPUTER_MARKER
  else
    square = empty_squares(board).sample
    board[square] = COMPUTER_MARKER
  end
end

def board_full?(board)
  empty_squares(board).empty?
end

def someone_won?(board)
  !!detect_winner(board)
end

def detect_winner(board)
  WINNING_LINES.each do |line|
    if board.values_at(*line).count(PLAYER_MARKER) == 3
      return 'Player'
    elsif board.values_at(*line).count(COMPUTER_MARKER) == 3
      return 'Computer'
    end
  end
  nil
end

def alternate_player(current_player)
  if current_player == 'Player'
    'Computer'
  elsif current_player == 'Computer'
    'Player'
  end
end

def one_game_loop(board, current_player)
  loop do
    display_board(board)
    place_piece!(board, current_player)
    current_player = alternate_player(current_player)
    break if someone_won?(board) || board_full?(board)
  end
  display_board(board)
end

def display_current_wins(player_wins, computer_wins)
  prompt "Your wins: #{player_wins.length}. Computer wins: #{computer_wins.length}."
end

def add_wins!(player_wins, computer_wins, board)
  if detect_winner(board) == 'Player'
    player_wins << 1
  else
    computer_wins << 1
  end
end

def five_wins?(wins)
  wins.length == 5
end

def display_grand_winner(player_wins, computer_wins)
  if five_wins?(player_wins)
    puts ''
    prompt "Congratulations! You are the grand winner!"
  elsif five_wins?(computer_wins)
    puts ''
    prompt "Computer is the grand winner. Better luck next time!"
  end
end

def erase_wins_totals!(computer_wins, player_wins)
  computer_wins.slice!(0, 5)
  player_wins.slice!(0, 5)
end

def play_again?
  prompt "Play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

# Start of main program
computer_wins = []
player_wins = []

loop do
  system 'clear'

  prompt "Welcome to Tic Tac Toe!"
  board = initialize_board
  current_player = player_picks_first_player

  one_game_loop(board, current_player)

  if someone_won?(board)
    prompt "#{detect_winner(board)} won!"
    add_wins!(player_wins, computer_wins, board)
  else
    prompt "It's a tie!"
  end

  display_current_wins(player_wins, computer_wins)
  display_grand_winner(player_wins, computer_wins)

  if five_wins?(player_wins) || five_wins?(computer_wins)
    erase_wins_totals!(player_wins, computer_wins)
  end

  break unless play_again?
end

prompt "Thanks for playing Tic Tac Toe! Goodbye!"
