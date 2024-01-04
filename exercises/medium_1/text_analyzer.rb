class TextAnalyzer
  def process(path)
    file = File.open(path)
    yield(file.read)
    file.close
  end
end

analyzer = TextAnalyzer.new
paths = ['ls_text_for_analysis.txt', 'my_text_for_analysis.txt']
paths.each do |path|
  analyzer.process(path) do |text|
    puts "#{text.split(/\n\n/).size} paragraphs"
  end
  analyzer.process(path) do |text|
    puts "#{text.split(/\n/).size} lines"
  end
  analyzer.process(path) do |text|
    puts "#{text.split.size} words"
  end
end