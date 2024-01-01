def max_by(arr)
  max_el = nil
  max_val = nil
  arr.each do |el| 
   if max_el.nil? || yield(el) > max_val
    max_el = el
    max_val = yield(el)
   end
  end
  max_el
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil