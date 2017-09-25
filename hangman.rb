require 'json'
class GameEngine
  require './hangman_game.rb'
  def initialize
    @hangman = Hangman.new
  end

  def show_menu
    puts 'Main Menu'
    puts '1. Play Game'
    puts '2. Save Game'
    puts '3. Load Game'
    menu_options(gets.chomp.to_i)
  end

  def menu_options(selection)
    case selection
    when 1
      main_loop
    when 2
      save_game(to_json)
    when 3
      load_game
    else
      puts 'Invalid Selection'
      show_menu
    end
  end

  def main_loop
    # until win? || lose?
    puts "\n\n"
    @hangman.display_playfield
    puts 'Make a guess!'
    @hangman.guess_handler(recieve_input)
    puts "\n\n"
    # end
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

  def to_json
    JSON.generate({hangman: @hangman})
  end

  def save_game(string)
    File.open('saved.json', 'w') do |game_file|
      game_file.write(string)
    end
  end
end

# Game logic
# Menu
# saving and loading
