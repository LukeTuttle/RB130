
def compute(arg)
  return 'Does not compute.' unless block_given?
  yield(arg)
end


# p compute { 5 + 3 } == 8
# p compute { 'a' + 'b' } == 'ab'
# p compute == 'Does not compute.'

p compute('there') { |input| 'hello ' + input } == 'hello there'
p compute(2) {|input| input + 3} == 5
p compute('hmmm')
