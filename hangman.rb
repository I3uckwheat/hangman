class GameEngine
  require './hangman_game.rb'
  def initialize
    @hangman = Hangman.new
    menu
  end

  def menu
    # Give options for:
    #   1. Start a new game
    #   2. Exit
  end

  def main_loop
    @hangman.guess_handler(recieve_input)
  end

  def recieve_input
    input_validator(gets.chomp)
  end

  def input_validator(input)
    valid = []
    input.split('').scan(/\w+/).each do |letter|
      valid << letter
    end
    invalid_input if valid.empty?
    valid
  end

  def invalid_input
    puts 'Invalid Input, try again'
    recieve_input
  end

  def win?
    @hangman.win?
  end

  def win_message
    'You won!'
  end

  def lose?
    @hangman.lose?
  end

  def lose_message
    'You lost!'
  end
end


# Game logic
# Menu
# saving and loading