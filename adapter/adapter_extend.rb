# Implementation(existed)
class Banner
  def initialize(str)
    @str = str
  end

  def show_with_paren
    puts "(#{@str})"
  end

  def show_with_aster
    puts "*#{@str}*"
  end
end

# Interface
# rubyなので必要ないがこういうIFを想定しているというメモ
class Printer
  def print_weak
    raise NotImplementedError.new
  end

  def print_strong
    raise NotImplementedError.new
  end
end

# Implementation(new)
class PrintBanner < Banner
  def print_weak
    show_with_paren
  end

  def print_strong
    show_with_aster
  end
end

## main
printer = PrintBanner.new("test")
printer.print_weak
printer.print_strong
