# Implement iterator pattern usin Enumerator
# to_enumでEnumeratorオブジェクトを取得して利用する

# loopを使う場合
# loopはStopIterationを例外処理してループを抜けてくれる
arr = [1, 2]
puts "+++++"
enumerator = arr.to_enum
puts enumerator.class
loop do
  obj = enumerator.next
  puts obj
end

# while trueを使う場合
# StopIterationが発生するのでrescueする必要がある
puts "+++++"
enumerator = arr.to_enum
begin
  while true
    obj = enumerator.next
    puts obj
  end
rescue StopIteration
  puts "END"
end

# 独自クラスで使う場合
# eachメソッドだけ実装しておけばOK
puts "+++++"
class ReversedString
  def initialize(str)
    @str_arr = str.chars.reverse
  end

  def each
    for c in @str_arr
      yield c
    end
  end
end

my_str = ReversedString.new("abcde")
enumerator = my_str.to_enum
loop do
  obj = enumerator.next
  puts obj
end
