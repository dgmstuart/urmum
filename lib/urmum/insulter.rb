require 'engtagger'

class Insulter
  INSULT_BEGINNINGS = [
    "You're",            
    "Your face is",
    "Your mum is", 
    "Your mum's face is" 
  ] 
  FALLBACK = "That's what she said"

  def initialize 
    @tagger = EngTagger.new
  end

  def insult_with(string)
    # Try and match against the beginning of the string. If so, get the next beginning from the array
    regexp = Regexp.new(%{^(?<start>#{INSULT_BEGINNINGS.join("|")}) (?<article>an|a) (?<thing>.*)})
    if matches = string.capitalize.match(regexp)
      index = INSULT_BEGINNINGS.index(matches[:start]) + 1
      if index < INSULT_BEGINNINGS.length
        return "#{INSULT_BEGINNINGS[index]} #{matches[:article]} #{matches[:thing]}"
      else
        return FALLBACK
      end
    end
    tagged_string = @tagger.add_tags(string)
    nouns = @tagger.get_nouns(tagged_string)

    if nouns.empty?
      FALLBACK
    else
      thing = nouns.keys.last
      "You're a #{thing}"
    end

  end
end