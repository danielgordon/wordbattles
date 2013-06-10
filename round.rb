#!/usr/bin/env ruby

require './dictionary.rb'

class Round
  attr_accessor :score

#TODO: WB uses buckets of 4 to 13+.  This doesn't account for that. 
  def initialize(file)
    @score = 0
    @words_played = Array.new()
    @word_dictionary = Dictionary.new(file)
  end

  def word_played?(word)
    @words_played.each do |played_word|
      if played_word == word
        return true
      end
    end
    return false
  end
  
  def words_of_length(length)
    count = 0
    @words_played.each do |played_word|
      if played_word.length == length
        count += 1
      end
    end
    return count
  end

  def word_valid?(word)
    return @word_dictionary.contains_word?(word)
  end

  def add_word(word)
    add_points(word)
    @words_played << word
  end

  def add_points(word)
    @score += 30 + (words_of_length(word.length)) * 30
  end

  def check_word(word)
    len = word.length
#TODO: doesn't tell you what's wrong with the word, fix
    if ((len > 3) and (words_of_length(len) < 3) and (not word_played?(word)) \
      and (word_valid?(word)))
      
      add_word(word)
      return true
    else
      return false 
    end 
  end
end
