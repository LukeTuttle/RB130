def divisors(int)
  divs = [1]
  divisor = int.even? ? 2 : 3
  inc_factor = int.even? ? 1 : 2
  while divisor <= int
    divs << divisor if (int % divisor).zero?
    divisor += inc_factor
  end
  divs
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891] # may take a minute
