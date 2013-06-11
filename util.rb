module Util
  def self.truncated_length(word)
    if (word.length > 13)
      return 13
    end
    return word.length
  end
end
