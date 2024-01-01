def step(start, fin, n)
  current_num = start
  until current_num >= fin
    yield(current_num)
    current_num += n
  end
  fin
end

step(1, 10, 3) { |value| puts "value = #{value}" }