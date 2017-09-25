class Dictionary
  def initialize
    @dictionary = File.new('./5desk.txt', 'r')
  end

  def random_word
    random_line.times { @dictionary.gets }
    $_.chomp.length.between?(5, 12) ? $_.chomp : random_word.strip
    # $_ is the last read string of 'gets'
  end

  def random_line
    random_line = rand(@dictionary.count) - 1
    @dictionary.rewind
    random_line
  end
end
