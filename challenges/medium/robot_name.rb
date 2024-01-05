class Robot
  @@names = []

  def name
    return @name unless @name.nil?

    @name = generate_name while @name.nil? || @@names.include?(@name)
    @@names << @name
    @name
  end

  def reset
    @@names.delete(@name)
    @name = nil
  end

  def generate_name
    str = ''
    2.times {str << ('A'..'Z').to_a.fetch(rand(26))}
    3.times { str << rand(10).to_s}
    str
  end
end