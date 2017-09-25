class Hangman
  def initialize
    @secret_word = 'testing'.split('') # select_word_from_list.split
    @incorrect_guesses = []
    @correct_guesses = Array.new(@secret_word.length, '_')
  end

  def select_word_from_list; end

  def display_playfield
    puts hanged_status
    puts @correct_guesses.to_s
    puts '----------------------------'
    puts @incorrect_guesses.to_s
  end

  def guess_handler(guesses)
    guesses.each do |letter|
      next if win? || lose?
      correct_guess?(letter) ? update_correct_guesses(letter) : update_incorrect_guesses(letter)
    end
  end

  def correct_guess?(letter)
    @secret_word.include?(letter)
  end

  def update_incorrect_guesses(letter)
    @incorrect_guesses << letter
    puts "Guesses #{@guesses}"
    @incorrect_guesses
  end

  def update_correct_guesses(letter)
    @secret_word.each_with_index do |secret_letter, index|
      @correct_guesses[index] = letter if letter == secret_letter
    end
    puts "Correct Guesses: #{@correct_guesses}"
  end

  def hanged_status
    case @incorrect_guesses.length
    when 1
      ['O']
    when 2
      [[' O'], [' |'], [' |']]
    when 3
      [[' O'], ['\\|'], [' |']]
    when 4
      [[' O'], ['\\|/'], [' |']]
    when 5
      [[' O'], ['\\|/'], [' |'], ["\/"]]
    when 6
      [[' O'], ['\\|/'], [' |'], ["\/ \\"]]
    end
  end

  def win?
    @correct_guesses == @secret_word
  end

  def lose?
    @incorrect_guesses.length == 6
  end
end
