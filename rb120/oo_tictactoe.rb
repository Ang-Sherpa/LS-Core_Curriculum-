class Board
  attr_reader :squares

  WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] + # rows
                  [[1, 4, 7], [2, 5, 8], [3, 6, 9]] + # cols
                  [[1, 5, 9], [3, 5, 7]] # diag

  def initialize
    @squares = {}
    reset
  end

  def []=(num, marker)
    @squares[num].marker = marker
  end

  def unmarked_keys
    @squares.keys.select { |key| @squares[key].unmarked? }
  end

  def square_five_empty?
    unmarked_keys.include?(5)
  end

  def available_keys_string
    case unmarked_keys.size
    when 1 then unmarked_keys.first.to_s
    when 2 then unmarked_keys.join(' or ')
    else
      "#{unmarked_keys[0..-2].join(', ')}, or #{unmarked_keys[-1]}"
    end
  end

  def full?
    unmarked_keys.empty?
  end

  def someone_won?
    !!winning_marker
  end

  # returns winning marker or nil
  def winning_marker
    WINNING_LINES.each do |line|
      squares = @squares.values_at(*line)
      return squares.first.marker if three_identical_markers?(squares)
    end
    nil
  end

  # rubocop:disable Metrics/AbcSize
  def draw
    puts "     |     |"
    puts "  #{@squares[1]}  |  #{@squares[2]}  |   #{@squares[3]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[4]}  |  #{@squares[5]}  |   #{@squares[6]}"
    puts "     |     |"
    puts "-----+-----+-----"
    puts "     |     |"
    puts "  #{@squares[7]}  |  #{@squares[8]}  |   #{@squares[9]}"
    puts "     |     |"
  end
  # rubocop:enable Metrics/AbcSize

  def reset
    (1..9).each { |key| @squares[key] = Square.new }
  end

  # returns the empty square key in a line with two identical markers
  def find_at_risk_square(line, marker)
    if @squares.values_at(*line).map(&:marker).count(marker) == 2
      @squares.select do |key, value|
        line.include?(key) && value.marker == Square::INITIAL_MARKER
      end.keys.first
    end
  end

  # checks all lines and uses find_at_risk_square
  def winning_square(marker)
    square = nil
    WINNING_LINES.each do |line|
      square = find_at_risk_square(line, marker)
      break if !!square
    end
    square
  end

  private

  def three_identical_markers?(squares)
    markers = squares.select(&:marked?).collect(&:marker)
    return false if markers.size != 3
    markers.min == markers.max
  end
end

class Square
  INITIAL_MARKER = ' '

  attr_accessor :marker

  def initialize(marker = INITIAL_MARKER)
    @marker = marker
  end

  def to_s
    @marker
  end

  def unmarked?
    marker == INITIAL_MARKER
  end

  def marked?
    marker != INITIAL_MARKER
  end
end

class Player
  attr_accessor :score, :name, :marker

  def initialize(marker = nil)
    @marker = marker
    @score = 0
    @name = nil
  end
end

class TTTGame
  COMPUTER_MARKER = 'O'

  attr_reader :board, :human, :computer

  def initialize
    @board = Board.new
    @human = Player.new
    @computer = Player.new(COMPUTER_MARKER)
    @current_marker = nil
  end

  def play
    clear
    set_players_names
    display_welcome_message
    set_human_marker
    set_first_to_move
    main_game
    display_goodbye_message
  end

  private

  def player_move
    loop do
      current_player_moves
      count_wins
      break if board.someone_won? || board.full?
      clear_screen_and_display_board if human_turn?
    end
  end

  def main_game
    loop do
      display_board
      player_move
      display_result
      reset_wins_to_zero if five_wins?
      break unless play_again?
      reset
      display_play_again_message
    end
  end

  def set_human_name
    username = ''
    loop do
      puts "What's your name?"
      username = gets.chomp
      break unless username.empty?
      puts "Sorry, must enter a value"
    end

    system 'clear'
    human.name = username.capitalize
  end

  def set_computer_name
    computer.name = %w[Botbot ComCom R2D2 Hairball Banana Machine].sample
  end

  def set_players_names
    set_human_name
    set_computer_name
  end

  def set_human_marker
    answer = nil
    puts "Pick your marker!"
    puts "Please type in one letter or symbol except for 'O'."
    loop do
      answer = gets.chomp
      break if answer.size == 1 && !answer.empty? && answer != 'O'
      puts "Invalid choice. Please enter one letter or symbol except for 'O'"
    end

    @human.marker = answer
  end

  def set_first_to_move
    answer = nil
    puts "Who should go first? Player (p) or Computer (c)"
    loop do
      answer = gets.chomp
      break if %w[player p computer c].include?(answer.downcase)
      puts "Invalid choice please pick player (p) or computer (c)"
    end

    @current_marker = if answer == 'computer' || answer == 'c'
                        COMPUTER_MARKER
                      else
                        human.marker
                      end
  end

  def display_welcome_message
    puts "Hello #{human.name}, welcome to Tic Tac Toe!"
    puts 'First one to win five games will be the grand winner!'
    puts ''
  end

  def display_goodbye_message
    puts "Thanks for playing Tic Tac Toe! Goodbye, #{human.name}!"
  end

  def display_board
    puts "You're a #{human.marker}. #{computer.name} is a #{computer.marker}"
    puts ""
    board.draw
    puts ""
  end

  def clear_screen_and_display_board
    clear
    display_board
  end

  def human_moves
    puts "Choose a square to place a piece: #{board.available_keys_string}"
    square = nil
    loop do
      square = gets.chomp.to_i
      break if board.unmarked_keys.include?(square)
      puts "Sorry, that's not a valid choice."
    end

    board[square] = human.marker
  end

  def computer_moves
    board[computer_square_choice] = computer.marker
  end

  def computer_square_choice
    computer_winning_square = board.winning_square(COMPUTER_MARKER)
    human_winning_square = board.winning_square(human.marker)

    if !!computer_winning_square
      computer_winning_square
    elsif !!human_winning_square
      human_winning_square
    elsif board.square_five_empty?
      5
    else
      board.unmarked_keys.sample
    end
  end

  def current_player_moves
    if human_turn?
      human_moves
      @current_marker = COMPUTER_MARKER
    else
      computer_moves
      @current_marker = human.marker
    end
  end

  def human_turn?
    @current_marker == human.marker
  end

  def display_result
    clear_screen_and_display_board

    case board.winning_marker
    when human.marker
      puts 'You won!'
    when computer.marker
      puts 'Computer won!'
    else
      puts "It's a tie!"
    end

    display_wins
    display_grand_winner if five_wins?
  end

  def clear
    system 'clear'
  end

  def play_again?
    answer = nil

    loop do
      puts "Would you like to play again (y/n)"
      answer = gets.chomp.downcase
      break if %w(y n).include?(answer)
      puts "Sorry, must be y or n"
    end

    answer == 'y'
  end

  def reset
    board.reset
    @current_marker = set_first_to_move
    clear
  end

  def display_play_again_message
    puts "Let's play again!"
    puts ''
  end

  def count_wins
    case board.winning_marker
    when human.marker then human.score += 1
    when computer.marker then computer.score += 1
    end
  end

  def display_wins
    puts ""
    puts "#{human.name} score: #{human.score}"
    puts "#{computer.name} score: #{computer.score}"
    puts ""
  end

  def five_wins?
    human.score == 5 || computer.score == 5
  end

  def display_grand_winner
    puts "We have a GRAND WINNER!!!"
    if human.score == 5
      puts "#{human.name} won five games!"
    else
      puts "#{computer.name} won five games! Better luck next time!"
    end
    puts ""
  end

  def reset_wins_to_zero
    human.score = 0
    computer.score = 0
  end
end

game = TTTGame.new
game.play
