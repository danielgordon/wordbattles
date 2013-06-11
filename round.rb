#!/usr/bin/env ruby

require './dictionary.rb'

class Round
  attr_accessor :score

  module WordResult
    WORD_OK = 0
    WORD_TOO_SHORT = 1
    WORD_TOO_MANY_OF_LENGTH = 2
    WORD_ALREADY_PLAYED = 3
    WORD_INVALID = 4
  end

  def initialize(file)
    @score = 0
    @words_played = Array.new(10) { Array.new() }
    @word_dictionary = Dictionary.new(file)
  end

  def word_bucket(word)
    bucket = -1 
    if (word.length > 13)
      bucket = 9
    elsif (word.length > 3)
      bucket = word.length - 4
    end
    return bucket
  end

  def word_played?(word)
    @words_played[word_bucket(word)].each do |played_word|
      if played_word == word
        return true
      end
    end
    return false
  end
  
  def words_of_length(word)
    return @words_played[word_bucket(word)].length
  end

  def word_valid?(word)
    return @word_dictionary.contains_word?(word)
  end

  def add_word(word)
    add_points(word)
    @words_played[word_bucket(word)] << word
  end

  def add_points(word)
    @score += 30 + (words_of_length(word)) * 30
  end

  def check_word(word)
#TODO: doesn't tell you what's wrong with the word, fix
    len = word.length
    if ((len > 3) and (words_of_length(word) < 3) and (not word_played?(word)) \
      and (word_valid?(word)))
      
      add_word(word)
    else
      return false 
    end 
  end
end
