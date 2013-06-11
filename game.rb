#!/usr/bin/env ruby

require './word_battles_round.rb'

dictionary_name = "./enable1.txt"

word = ""
round = WordBattlesRound.new(dictionary_name)
while (!word.eql?("q"))
  puts "Enter word: "
  word = gets.chomp
  case (round.check_word(word))
    when WordResult::WORD_OK
      puts "Good word!"
    when WordResult::WORD_TOO_SHORT
      puts "Too short"
    when WordResult::WORD_TOO_MANY_OF_LENGTH
      puts "Too many of length " + Util::truncated_length(word).to_s
    when WordResult::WORD_ALREADY_PLAYED
      puts "Word already played"
    when WordResult::WORD_INVALID
      puts "Word not in dictionary"
  end
    puts "Score: " + round.score.to_s
end
