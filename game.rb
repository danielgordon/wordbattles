require './word_battles_round.rb'
require './prefix_list.rb'

class WordBattlesGame
  attr_accessor :score
  attr_accessor :prefix
  attr_accessor :round_num

  def select_prefixes()
    @prefixes = Array.new()
    @prefixes << @prefix_generator.get_prefix
    temp_prefix = @prefix_generator.get_prefix
    while (temp_prefix.eql?(@prefixes[0]))
      temp_prefix = @prefix_generator.get_prefix
    end
    @prefixes << temp_prefix 
    while (temp_prefix.eql?(@prefixes[0]) or temp_prefix.eql?(@prefixes[1]))
      temp_prefix = @prefix_generator.get_prefix
    end
    @prefixes << temp_prefix 
  end
  
  def initialize(dictionary_file, prefix_file)
    @dictionary_file = dictionary_file 
    @prefix_generator = PrefixList.new(prefix_file)
    @score = 0
    @round_num = 1
    select_prefixes
  end


  def start_round()
    @prefix = @prefixes[@round_num - 1]
    @round = WordBattlesRound.new(@dictionary_file, @prefix)
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
