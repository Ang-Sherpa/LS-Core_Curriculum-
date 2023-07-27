VALID_CHOICES = %w[rock paper scissors lizard spock r p sc l sp s].freeze
COMPUTER_CHOICES = %w[rock paper scissors lizard spock].freeze

MOVES = { 'rock' => %w[scissors lizard],
          'paper' => %w[rock spock],
          'scissors' => %w[paper lizard],
          'lizard' => %w[spock paper],
          'spock' => %w[scissors rock] }.freeze

def prompt(message)
  puts "=> #{message}"
end

def border_lines
  prompt('-----------------------------------------------------------')
end

def display_welcome_prompt
  prompt('Welcome to rock, paper, scissors, lizard, spock.')
  prompt('The first player to win three rounds will be declared the grand winner!')
  border_lines
  prompt("Choose one: #{COMPUTER_CHOICES.join(', ')}.")
  prompt('(You can also type the first letter of your choice)')
end

def set_valid_choice
  loop do
    player_choice = gets.chomp.downcase

    return player_choice if VALID_CHOICES.include?(player_choice)

    prompt("That's not a valid choice. Please choose again.")
    prompt("Choose one: #{COMPUTER_CHOICES.join(', ')}.")
  end
end

def set_spock_or_scissors
  prompt("You typed 's' as your choice. Did you mean spock(sp) or scissors(sc)?")
  loop do
    choice = gets.chomp
    if %w[spock sp].include?(choice)
      return 'spock'
    elsif %w[scissors sc].include?(choice)
      return 'scissors'
    end

    prompt("I'm sorry I didn't catch that. Did you mean spock(sp) or scissors(sc)?")
  end
end

def get_full_choice_name(choice)
  choice_name = { 'r' => 'rock',
                  'p' => 'paper',
                  'sc' => 'scissors',
                  'l' => 'lizard',
                  'sp' => 'spock' }

  choice_name[choice]
end

def win?(first, second)
  MOVES[first].include?(second)
end

def three_wins?(wins)
  wins == 3
end

def display_three_wins(player_wins, computer_wins)
  if three_wins?(player_wins)
    prompt('You win! You are the grand winner!')
    border_lines
  elsif three_wins?(computer_wins)
    prompt('Computer wins! It is the grand winner!')
    border_lines
  end
end

def display_results(player, computer)
  border_lines
  prompt("You chose: #{player}; computer chose: #{computer}")

  if win?(player, computer)
    prompt('You won!')
  elsif win?(computer, player)
    prompt('You lost!')
  else
    prompt("It's a tie!")
  end
end

def display_wins(player_wins, computer_wins, number_of_games)
  border_lines
  prompt("Your score: #{player_wins}")
  prompt("Computer score: #{computer_wins} ")
  prompt("Number of games played:  #{number_of_games}")
  border_lines
end

# Main program
display_welcome_prompt

# Main loop
loop do
  computer_wins = 0
  player_wins = 0
  number_of_games = 0

  loop do
    player_choice = set_valid_choice

    player_choice = set_spock_or_scissors if player_choice == 's'
    player_choice = get_full_choice_name(player_choice) if player_choice.length <= 2

    computer_choice = COMPUTER_CHOICES.sample

    player_wins += 1 if win?(player_choice, computer_choice)
    computer_wins += 1 if win?(computer_choice, player_choice)
    number_of_games += 1

    system('clear')

    display_results(player_choice, computer_choice)
    display_wins(player_wins, computer_wins, number_of_games)
    display_three_wins(player_wins, computer_wins)

    break if three_wins?(player_wins) || three_wins?(computer_wins)

    prompt("Choose one: #{COMPUTER_CHOICES.join(', ')}.")
  end

  prompt('Do you want to start a new game? Type Y/y to continue.')
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')

  system('clear')
end

prompt('Thank you for playing. Goodbye!')
