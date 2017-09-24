class GameEngine
  def initialize
    @hangman = Hangman.new
    menu
  end

  def menu; end

  def main_loop; end

  def recieve_input; end

  def input_validator; end

  def valid_input?; end

  def update_playfield; end

  def win?; end

  def lose?; end

  class Hangman
    def initialize
      @secret_word = select_word_from_list.split
      @hanged_status = [[][][]]
      @guesses = []
      @correct_guesses = []
    end

    def select_word_from_list; end

    def display_playfield; end

    def guess_handler(letter); end

    def update_hanged_status; end

    def update_guesses(letter); end

    def update_correct_guesses(letter); end

    def win?; end

    def lose?; end
  end
end
