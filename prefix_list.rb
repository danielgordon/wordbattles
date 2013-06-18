require './string_list.rb'

class PrefixList < StringList

  def get_random_prefix
    return @values[Random.rand(@values.length)]
  end

end
