
class Move
  VALID_CHOICES = { 'rock' => 'r',
                    'lizard' => 'l',
                    'spock' => 'sp',
                    'paper' => 'p',
                    'scissors' => 'sc' }

  WINNING_MOVES = { 'rock' => %w[scissors lizard],
                    'paper' => %w[rock spock],
                    'scissors' => %w[paper lizard],
                    'lizard' => %w[spock paper],
                    'spock' => %w[scissors rock] }

  def initialize(value)
    @value = value
  end

  def to_s
    @value
  end

  def >(other_move)
    WINNING_MOVES[@value.to_s].include?(other_move.to_s)
  end

  def <(other_move)
    WINNING_MOVES[other_move.to_s].include?(@value.to_s)
  end
end

class Player
  attr_accessor :move, :name, :score

  def initialize
    set_name
    @score = 0
  end

  def to_s
    @name
  end
end

class Human < Player
  def set_name
    username = ''
    loop do
      puts "What's your name?"
      username = gets.chomp
      break unless username.empty?
      puts "Sorry, must enter a value"
    end

    self.name = username.capitalize
  end

  def choose
    choice = nil
    loop do
      puts "Please choose rock (r), paper (p), scissors (sc), lizard (l), or spock (sp):"
      choice = gets.chomp
      break if Move::VALID_CHOICES.keys.include?(choice) || Move::VALID_CHOICES.values.include?(choice)
      puts "Sorry, invalid choice"
    end

    choice = Move::VALID_CHOICES.key(choice) if choice.length <= 2
    self.move = Move.new(choice)
  end
end

class Computer < Player
  def set_name
    self.name = ['R2D2', 'Hinite', 'Hal', 'CPU'].sample
  end

  def choose
    case @name.to_s
    when 'CPU'
      self.move = Move.new(Move::VALID_CHOICES.keys.sample)
    when 'Hinite'
      self.move = Move.new(%w(rock spock).sample)
    when 'Hal'
      self.move = Move.new(%w(lizard lizard lizard lizard paper scissors spock).sample)
    when 'R2D2'
      self.move = Move.new(%w(spock spock spock scissors scissors scissors rock).sample)
    end
  end
end

class RPSGame
  attr_accessor :human, :computer, :history_hash

  def initialize
    @human = Human.new
    @computer = Computer.new
    @history_hash = {}
    @hash_key = 1
  end

  def play
    display_welcome_message

    loop do
      each_player_chooses
      display_moves
      display_winner
      show_score
      display_grand_winner
      clear_score if grand_winner?
      play_again? ? clear : break
    end

    view_history?
    display_goodbye_message
  end

  private

  def display_welcome_message
    clear
    puts "Welcome to Rock, Paper, Scissors, Lizard, Spock!"
    puts "First one to 5 wins will be declared the Grand Winner!"
    puts "#{human.name} will be playing with #{computer.name}"
    puts "--------------"
    puts ""
  end

  def display_goodbye_message
    puts "Thanks for playing Rock, Paper, Scissors, Lizard, Spock! Goodbye!"
  end

  def each_player_chooses
    human.choose
    computer.choose
    save_history
    clear
  end

  def save_history
    moves_made = "#{human.name}: #{human.move}; #{computer.name}: #{computer.move}"
    history_hash[@hash_key] = [moves_made]
    @hash_key += 1
  end

  def display_history
    puts
    puts "History of moves"
    history_hash.each do |key, value|
      puts "Round #{key}"
      puts value
      puts '------------'
    end
  end

  def display_moves
    puts "#{human.name} chose #{human.move}."
    puts "#{computer.name} chose #{computer.move}."
    puts ""
  end

  def human_won?
    human.move > computer.move
  end

  def computer_won?
    human.move < computer.move
  end

  def display_winner
    if human_won?
      puts "#{human.name} won!"
    elsif computer_won?
      puts "#{computer.name} won!"
    else
      puts "It's a tie!"
    end
  end

  def add_score
    human.score += 1 if human_won?
    computer.score += 1 if computer_won?
  end

  def show_score
    add_score
    puts ""
    puts "--------------"
    puts "#{human.name} wins: #{human.score}"
    puts "#{computer.name} wins: #{computer.score}"
    puts "--------------"
    puts ""
  end

  def clear_score
    human.score = 0
    computer.score = 0
  end

  def display_grand_winner
    if human.score == 5
      puts "#{human.name} is the GRAND WINNER!!!"
    elsif computer.score == 5
      puts "#{computer.name} is the GRAND WINNER!!!"
    end
  end

  def grand_winner?
    computer.score == 5 || human.score == 5
  end

  def view_history?
    puts "Would you like to view your history of moves? (type y to view)"
    answer = gets.chomp
    display_history if %w(y yes).include?(answer.downcase)
  end

  def play_again?
    answer = nil
    loop do
      puts "Would you like to play again (y/n)"
      answer = gets.chomp
      break if %w(y n yes no).include?(answer.downcase)
      puts "Sorry, must by y or n"
    end

    %w(y yes).include?(answer.downcase)
  end

  def clear 
    system 'clear'
  end
end

# Main Game Play

game = RPSGame.new
game.play
