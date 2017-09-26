require 'json'
class GameEngine
  require './hangman_game.rb'
  def initilize; end

  def show_menu
    puts 'Main Menu'
    puts '1. New Game'
    puts '2. Resume Game'
    puts '3. Save Game'
    puts '4. Load Game'
    puts ''
    menu_options(gets.chomp.to_i)
  end

  def menu_options(selection)
    case selection
    when 1
      new_game
    when 2
      resume_game
    when 3
      save_game
    when 4
      load_game
    else
      puts 'Invalid Selection'
      show_menu
    end
  end

  def new_game
    @hangman = Hangman.new
    main_loop
  end

  def resume_game
    defined? @hangman ? main_loop : no_resume
  end

  def no_resume
    puts 'No game to resume'
    menu_options
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
    if input == '/menu'
      show_menu
    else
      valid = []
      input.scan(/\w+/).join.each_char do |letter|
        valid << letter
      end
      invalid_input if valid.empty?
    end
    valid ||= []
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

  def save_game
    @hangman.save_the_game
  end

  def load_game
    @hangman = Hangman.new
    @hangman.load_game
    main_loop
  end
end

# Game logic
# Menu
# saving and loading
