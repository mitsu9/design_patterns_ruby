# Abstract class
class AbstractDisplay
  # subclassに実装を要求するメソッド
  # 3通りの書き方
  def open
    raise NotImplementedError
  end
  def my_print() raise NotImplementedError end
  define_method(:close) { raise NotImplementedError }

  def display
    open
    5.times do
      my_print
    end
    close
  end
end

# Concreate classes
class CharDisplay < AbstractDisplay
  def initialize(char)
    @char = char
  end

  def open
    print "<<"
  end

  def my_print
    print @char
  end

  def close
    puts ">>"
  end
end

class StringDisplay < AbstractDisplay
  def initialize(str)
    @str = str
  end

  def open
    puts "+----------+"
  end

  def my_print
    puts "|#{@str}|"
  end

  def close
    puts "+----------+"
  end
end

## main
d_c = CharDisplay.new("C")
d_s = StringDisplay.new("Hello Worlds")

d_c.display
d_s.display
