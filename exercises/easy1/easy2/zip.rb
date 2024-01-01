def zip(arr1, arr2)
  out_arr = []
  arr1.each_with_index do |el, i|
    out_arr << [el, arr2[i]]
  end
  out_arr
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]