#!/usr/bin/env ruby

require './dictionary.rb'

class Round
  attr_accessor :score

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
    case words_of_length(word)
    when 0
      @score += 30
    when 1
      @score += 60
    when 2
      @score += 90
    end
  end

  def check_word(word)
    len = word.length
    if ((len > 3) and (words_of_length(len) < 3) and (not word_played?(word)) \
      and (word_valid?(word)))
      
      add_word(word)
      return true
    else
      return false 
    end 
  end
end
