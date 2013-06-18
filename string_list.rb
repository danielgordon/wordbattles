class StringList

  def initialize(file)
  #file is a \n-separated list of strings.
    @values = Array.new()
    file = File.new(file)
    while (string = file.gets)
      @values << string.chomp
    end
    @values.sort!
    file.close
  end

end
