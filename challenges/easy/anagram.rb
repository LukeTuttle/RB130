class Anagram
  def initialize(word)
    @word = word
  end

  def match(arr)
    arr.select { |candidate| @word.downcase != candidate.downcase && (chars_tally(@word) == chars_tally(candidate)) }
  end

  def chars_tally(str)
    str.downcase.chars.tally
  end
end