class Scrabble
  CHAR_SCORES =
  %w(a e i o u l n r s t d g b c m p f h v w y k j x q z).zip(
    [1,1,1,1,1,1,1,1,1,1,2,2,3,3,3,3,4,4,4,4,4,5,8,8,10,10]
  ).to_h

  def initialize(word)
    @word = word ? word : ''
  end

  def score
    score = 0
    return score unless valid_word?(@word)
    @word.each_char do |char|
      score += CHAR_SCORES[char.downcase]
    end
    score
  end

  def self.score(word)
    new(word).score
  end

  private

  def valid_word?(word)
    word.instance_of?(String) && !word.empty? && (word.chomp == word)
  end
end