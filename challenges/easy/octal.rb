class Octal
  def initialize(str)
    @value = str
  end

  def to_decimal
    return 0 unless integer = to_int(@value)

    sum = 0
    integer.digits.each_with_index do |digit, i|
      sum += (digit * 8 ** i)
    end
    sum
  end

  def to_int(str)
    return nil if str.match?(/[^0-7]/)

    str.to_i
  end
end
