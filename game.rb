#!/usr/bin/env ruby

require './round.rb'

dictionary_name = "./dictionary"

word = ""
round = Round.new(dictionary_name)
while (!word.eql?("q"))
  puts "Enter word: "
  word = gets.chomp
  if (round.check_word(word))
    puts "Good word!"
    puts "Score: " + round.score.to_s
  else
    puts "No good"
  end
end
