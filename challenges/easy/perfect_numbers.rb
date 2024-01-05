class PerfectNumber
  def initialize
  end

  def self.classify(num)
    raise StandardError unless num >= 1 && num.instance_of?(Integer)

    aliquot_sum = factorize(num).sum
    case 
    when aliquot_sum == num then 'perfect'
    when aliquot_sum > num then 'abundant'
    when aliquot_sum < num then 'deficient'
    end
  end

  class << self
    private

    def factorize(num)
      factors = [1]
      2.upto((num / 2)) do |divisor|
        quo, remainder = num.divmod(divisor)
        factors.push(divisor, quo) if remainder.zero?
      end
      factors.uniq
    end
  end
end
