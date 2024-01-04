class Diamond
  ALPHABET = ('A'..'Z').to_a

  def self.make_diamond(letter)
    letter_i = ALPHABET.index(letter)
    width = letter_i * 2 + 1
    letters = ALPHABET.slice(0..letter_i)
    letters += letters.reverse.slice(1..)

    letters.each_with_object('') { |let, obj| obj << "#{make_row_string(let, width)}\n" }
  end

  class << self
    private

    def make_row_string(letter, width)
      string = ' ' * width
      mid_point = (width / 2).floor
      ln_let_i = ALPHABET.index(letter)
      string[(mid_point - ln_let_i)] = letter
      string[mid_point + ln_let_i] = letter
      string
    end
  end
end

# # Alternative helper method definition
# def make_row_string(letter, width)
#   if letter == 'A'
#     letter.center(width)
#   else
#     center_padding = ' ' * (2 * ALPHABET.index(letter) - 1)
#     str = letter + center_padding + letter
#     str.center(width)
#   end
# end
