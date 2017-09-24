class Hangman
  def initialize
    @secret_word = 'testing'.split('') # select_word_from_list.split
    @hanged_status = Array.new(3, [])
    @incorrect_guesses = []
    @correct_guesses = Array.new(@secret_word.length, '_')
  end

  def select_word_from_list; end

  def display_playfield; end

  def guess_handler(guesses)
    guesses.each do |letter|
      correct_guess?(letter) ? update_correct_guesses(letter) : update_incorrect_guesses(letter)
    end
  end

  def correct_guess?(letter)
    @secret_word.include?(letter)
  end

  def update_incorrect_guesses(letter)
    next if win? || lose?
    @incorrect_guesses << letter
    puts "Guesses #{@guesses}"
    @incorrect_guesses
  end

  def update_correct_guesses(letter)
    next if win? || lose?
    @secret_word.each_with_index do |secret_letter, index|
      @correct_guesses[index] = letter if letter == secret_letter
    end
    puts "Correct Guesses: #{@correct_guesses}"
  end

  def update_hanged_status
    hanged_man = { head: ' O', rarm: '\\', larm: ' /',
                   torso: " |\n |", rleg: '/ ', lleg: '\\' }
    # use @incorrect_guesses.length to calculate amount of limbs
  end

  def win?
    @correct_guesses == @secret_word
  end

  def lose?
    @incorrect_guesses.length == 6
  end
end
