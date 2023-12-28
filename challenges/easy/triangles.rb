class Triangle
  def initialize(s1, s2, s3)
    @sides = [s1, s2, s3]
    raise ArgumentError.new "Invalid triangle lengths" unless valid?
  end

  def kind
    case sides.uniq.size
    when 1 then 'equilateral'
    when 2 then 'isosceles'
    when 3 then 'scalene'
    end
  end

  private

  attr_reader :sides

  def valid?
    sides.min.positive? && (sides.max < (sides.sum - sides.max))
  end
end
