def select(arr)
  out_arr = []
  counter = 0
  if block_given?
    while counter < arr.size
      current_element = arr[counter]
      out_arr << current_element if yield(current_element)
      counter += 1
    end
  end
  out_arr
end

array = [1, 2, 3, 4, 5]

p select(array) { |num| num.odd? }      # => [1, 3, 5]
p select(array) { |num| puts num }      # => [], because "puts num" returns nil and evaluates to false
p select(array) { |num| num + 1 }       # => [1, 2, 3, 4, 5], because "num + 1" evaluates to true