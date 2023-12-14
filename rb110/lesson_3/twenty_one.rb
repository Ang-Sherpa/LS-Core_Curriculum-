require 'pry'

SUITS = ['H', 'C', 'S', 'D']
VALUES = ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K', 'A']

def prompt(msg)
  puts "=> #{msg}"
end

def empty_line
  puts ' '
end

def welcome_message
  system 'clear'
  prompt "Welcome to Whatever-One!"
  prompt "You can pick any number you want to play for: 21? 31? 41? 51?"
  puts "-------------"
end

def set_winning_value
  loop do
    answer = gets.chomp.to_i
    if [21, 31, 41, 51].include?(answer)
      return answer
    else
      prompt 'Please enter 21, 31, 41, or 51.'
    end
  end
end

def display_current_wins(player_wins, dealer_wins, winning_value)
  prompt "Current wins. Player: #{player_wins}. Dealer: #{dealer_wins}"
  prompt "First to five wins will be declared the grand winner!"
  prompt "The winning value is #{winning_value}"
  puts "-------------"
  empty_line
end

def initialize_deck
  SUITS.product(VALUES).shuffle
end

def deal!(deck, cards_in_hand, number)
  number.times { cards_in_hand << deck.pop }
end

def total(cards, winning_value)
  values = cards.map { |card| card[1] }
  total = 0

  values.each do |card|
    if card == 'A'
      total += 11
    elsif card.to_i == 0
      total += 10
    else
      total += card.to_i
    end
  end

  values.select { |card| card == 'A' }.count.times do
    total -= 10 if total > winning_value
  end
  total
end

def validate_user_input(answer)
  loop do
    answer = gets.chomp.downcase
    return answer if ['h', 's', 'hit', 'stay'].include?(answer)
    prompt "Invalid answer. Please pick 'h' for hit or 's' for stay."
  end
end

def display_hand(cards, which_player, total = '?')
  case which_player
  when 'Player'
    prompt "Player's hand: #{cards}"
    prompt "Player's total: #{total}"
  when 'Dealer'
    prompt "Dealer's hand: #{cards}"
    prompt "Dealer's total: #{total}"
  end
end

def show_initial_cards(player_cards, dealer_cards, player_total)
  display_hand(player_cards, 'Player', player_total)
  empty_line
  prompt "Dealer has two cards. One is hidden."
  display_hand(dealer_cards[[0, 1].sample], 'Dealer')
end

def busted?(total, winning_value)
  total > winning_value
end

def display_player_busted(player_cards, player_total, dealer_cards, dealer_total)
  puts "-------------"
  prompt 'You busted! Dealer wins. Better luck next time!'
  end_of_round_output(player_cards, player_total, dealer_cards, dealer_total)
end

def end_of_round_output(player_cards, player_total, dealer_cards, dealer_total)
  empty_line
  display_hand(player_cards, 'Player', player_total)
  empty_line
  display_hand(dealer_cards, 'Dealer', dealer_total)
  empty_line
end

def dealer_turn!(deck, dealer_cards, dealer_total, dealer_limit, winning_value)
  loop do
    break if dealer_total >= dealer_limit || busted?(dealer_total, winning_value)
    deal!(deck, dealer_cards, 1)
    dealer_total = total(dealer_cards, winning_value)
  end
end

def determine_winner(player_total, dealer_total)
  if player_total > dealer_total
    'Player'
  elsif player_total < dealer_total
    'Dealer'
  else
    'Tie'
  end
end

def display_winner(player_total, dealer_total)
  winner = determine_winner(player_total, dealer_total)
  case winner
  when 'Player' then prompt 'You won!'
  when 'Dealer' then prompt 'Dealer won!'
  when 'Tie' then prompt "It's a tie!"
  end
end

def five_wins?(wins)
  wins == 5
end

def display_grand_winner(winner)
  empty_line
  prompt "#{winner} has five wins! #{winner} is the grand winner!"
end

def play_again?
  puts "-------------"
  prompt 'Do you want to play again? (y/n)'
  answer = gets.chomp.downcase
  answer.start_with?('y')
end

# Main game loop

player_wins = 0
dealer_wins = 0

welcome_message
winning_value = set_winning_value
dealer_limit = winning_value - 4

loop do
  system 'clear'
  display_current_wins(player_wins, dealer_wins, winning_value)

  deck = initialize_deck
  player_cards = []
  dealer_cards = []

  # initial deal
  deal!(deck, player_cards, 2)
  deal!(deck, dealer_cards, 2)

  player_total = total(player_cards, winning_value)
  dealer_total = total(dealer_cards, winning_value)

  show_initial_cards(player_cards, dealer_cards, player_total)

  # Player turn
  loop do
    empty_line
    prompt 'Would you like to (h)it or (s)tay?'
    answer = validate_user_input(answer)

    deal!(deck, player_cards, 1) if answer == 'h'
    system 'clear'
    player_total = total(player_cards, winning_value)
    display_hand(player_cards, 'Player', player_total)
    break if answer == 's' || busted?(player_total, winning_value)
  end

  if busted?(player_total, winning_value)
    display_player_busted(player_cards, player_total, dealer_cards, dealer_total)
    dealer_wins += 1
    display_grand_winner('Dealer') if five_wins?(dealer_wins)
    play_again? ? next : break
  else
    system 'clear'
    prompt "You chose to stay! Now it's the dealer's turn"
    empty_line
  end

  # Dealer turn
  dealer_turn!(deck, dealer_cards, dealer_total, dealer_limit, winning_value)
  dealer_total = total(dealer_cards, winning_value)

  if busted?(dealer_total, winning_value)
    prompt 'Dealer busted! You win.'
    player_wins += 1
  else
    display_winner(player_total, dealer_total)
    player_wins += 1 if determine_winner(player_total, dealer_total) == 'Player'
    dealer_wins += 1 if determine_winner(player_total, dealer_total) == 'Dealer'
  end

  end_of_round_output(player_cards, player_total, dealer_cards, dealer_total)

  # if either has five wins
  if five_wins?(player_wins) || five_wins?(dealer_wins)
    if five_wins?(player_wins)
      display_grand_winner('Player')
    else
      display_grand_winner('Dealer')
    end

    player_wins = 0
    dealer_wins = 0
    winning_value = nil
    dealer_limit = nil
  end

  break unless play_again?
end

prompt "Thanks for playing Whatever-One! Goodbye!"
