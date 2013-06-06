class Dictionary

  def initialize(file)
  #file is a \n-separated list of words.
    @words = Array.new()
    file = File.new(file)
    while (word = file.gets)
      @words << word 
    end
    @words.sort!
    file.close
  end

  def contains_word?(word)
    #Yes, we should be binary searching.  Do that another time.
    @words.each do |current_word|
      if word == current_word
        return true
      end
    end
    return false 
  end

end
