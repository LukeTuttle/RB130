def reduce(arr, default = 0)
  accumulator = default
  counter = 0

  if block_given?
    while counter < arr.size
      el = arr[counter]
      accumulator = yield(accumulator, el)
      counter += 1
    end
  end
  accumulator
end




array = [1, 2, 3, 4, 5]

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
reduce(array) { |acc, num| acc + num if num.odd? }        # => NoMethodError: undefined method `+' for nil:NilClass