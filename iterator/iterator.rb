# Implements iterator pattern
class Aggregate
  def iterator
    raise NotImplementedError.new
  end
end

class Iterator
  def has_next?
    raise NotImplementedError.new
  end

  def next
    raise NotImplementedError.new
  end
end

class BookShelf < Aggregate
  def initialize
    @arr = []
  end

  def iterator
    BookShelfIterator.new(self)
  end

  def append_book(book)
    @arr << book
  end

  def length
    @arr.length
  end

  def get_book_at(idx)
    @arr[idx]
  end
end

class BookShelfIterator < Iterator
  def initialize(book_shelf)
    @book_shelf = book_shelf
    @index = 0
  end

  def has_next?
    @index < @book_shelf.length
  end

  def next
    book = @book_shelf.get_book_at(@index)
    @index += 1
    book
  end
end

class Book
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

## main
book_shelf = BookShelf.new
book_shelf.append_book(Book.new("name1"))
book_shelf.append_book(Book.new("name2"))
book_shelf.append_book(Book.new("name3"))
book_shelf.append_book(Book.new("name4"))

it = book_shelf.iterator
while it.has_next?
  book = it.next
  puts book.name
end
