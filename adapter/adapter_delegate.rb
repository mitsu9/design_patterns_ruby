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

# Abstract class
class Printer
  def print_weak
    raise NotImplementedError.new
  end

  def print_strong
    raise NotImplementedError.new
  end
end

# Implementation(new)
class PrintBanner < Printer
  def initialize(str)
    @banner = Banner.new(str)
  end

  def print_weak
    @banner.show_with_paren
  end

  def print_strong
    @banner.show_with_aster
  end
end

require 'forwardable'
class PrintBanner2 < Printer
  extend Forwardable

  def initialize(str)
    @banner = Banner.new(str)
  end

  def_delegator :@banner, :show_with_paren, :print_weak
  def_delegator :@banner, :show_with_aster, :print_strong
end

## main
printer = PrintBanner.new("test")
printer.print_weak
printer.print_strong

puts "Use Forwardable"
printer2 = PrintBanner2.new("test")
printer2.print_weak
printer2.print_strong
