module FormattingHelper
  # Kramdown, compatible with Ruby, Rubinius and JRuby
  def markdown(text)
    raw Kramdown::Document.new(text).to_html
  end
end
