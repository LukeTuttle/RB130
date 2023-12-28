class DNA
  def initialize(seq)
    @seq = seq
  end

  def hamming_distance(other_seq)
    shorter, longer = [@seq, other_seq].sort_by(&:length)
    shorter.chars.each_with_index.count { |base, i| base != longer[i]}
  end
end
