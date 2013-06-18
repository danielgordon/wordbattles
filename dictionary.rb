require './string_list.rb'

class Dictionary < StringList

  def contains_word?(word)
    #Yes, we should be binary searching.  Do that another time.
    @values.each do |current_word|
      if word.eql?(current_word)
        return true
      end
    end
    return false 
  end

end
