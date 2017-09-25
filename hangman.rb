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
    until win? || lose?
      puts "\n\n"
      @hangman.display_playfield
      puts 'Make a guess!'
      @hangman.guess_handler(recieve_input)
      puts "\n\n"
    end
    win? ? win_message : lose_message
  end

  def recieve_input
    input_validator(gets.chomp)
  end

  def input_validator(input)
    valid = []
    input.scan(/\w+/).join.each_char do |letter|
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
    puts 'You won!'
    @hangman.display_playfield
  end

  def lose?
    @hangman.lose?
  end

  def lose_message
    puts 'You lost!'
    @hangman.display_playfield
  end
end

# Game logic
# Menu
# saving and loading
