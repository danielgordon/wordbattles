require './word_battles_round.rb'
require './prefix_list.rb'

class WordBattlesGame
  attr_accessor :score
  attr_accessor :prefix
  attr_accessor :round

  def initialize(dictionary_file, prefix_file)
    @dictionary_file = dictionary_file 
    @prefixes = PrefixList.new(prefix_file)
    @score = 0
    @round_num = 1
  end

  def start_round()
    @prefix = @prefixes.get_prefix()
    @round = WordBattlesRound.new(@dictionary_file, @prefixes.get_prefix())
  end

  def play_word(word)
    return @round.check_word(word)
  end

  def round_score()
    return @round.score
  end

  def end_round()
    @score += @round.score
    @round_num += 1
  end
end
