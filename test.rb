#!/usr/bin/env ruby

require './game.rb'

dictionary_name = "./enable1.txt"
prefix_list_name = "./sample_prefixes"

word = ""
game = WordBattlesGame.new(dictionary_name, prefix_list_name)
game.start_round
puts "Round 1, fight!  Prefix is " + game.prefix.to_s
while (!word.eql?("q"))
  puts "Enter word (end to end round): "
  word = gets.chomp
  if (word.eql?("end"))
    puts "Final round score: " + game.round_score.to_s
    game.end_round
    if (game.round_num > 3)
      puts "Game over!  Final score: " + game.score.to_s
      break
    else
      game.start_round
      puts "Round " + game.round_num.to_s + ", fight!  Prefix is " + 
        game.prefix.to_s
    end
  else
    case (game.play_word(word))
      when WordResult::WORD_OK
        puts "Good word!"
      when WordResult::WORD_TOO_SHORT
        puts "Too short"
      when WordResult::WORD_TOO_MANY_OF_LENGTH
        puts "Too many of length " + Util::truncated_length(word).to_s
      when WordResult::WORD_ALREADY_PLAYED
        puts "Word already played"
      when WordResult::WORD_WRONG_PREFIX
        puts "Word does not match prefix" 
      when WordResult::WORD_INVALID
        puts "Word not in dictionary"
    end
    puts "Score: " + game.round_score.to_s
  end
end
