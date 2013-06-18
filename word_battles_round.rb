#!/usr/bin/env ruby

require './dictionary.rb'
require './util.rb'

module WordResult
  WORD_OK = 0
  WORD_TOO_SHORT = 1
  WORD_TOO_MANY_OF_LENGTH = 2
  WORD_ALREADY_PLAYED = 3
  WORD_INVALID = 4
end

class WordBattlesRound
  attr_accessor :score

  def initialize(dictionary_file, prefix)
    @score = 0
    @words_played = Array.new(10) { Array.new() }
    @word_dictionary = Dictionary.new(dictionary_file)
    @prefix = prefix
  end

  def word_bucket(word)
    return Util::truncated_length(word) - 4
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
    word_result = WordResult::WORD_OK
    if (word.length < 4)
      word_result = WordResult::WORD_TOO_SHORT
    elsif (words_of_length(word) >= 3)
      word_result = WordResult::WORD_TOO_MANY_OF_LENGTH
    elsif (word_played?(word))
      word_result = WordResult::WORD_ALREADY_PLAYED
    elsif (not word_valid?(word))
      word_result = WordResult::WORD_INVALID 
    else
      word_result = WordResult::WORD_OK
      add_word(word)
    end

    return word_result 
  end
end
