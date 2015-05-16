# Ruby初級者向けレッスン 53回
## Array と Hash

### 演習問題 1

`Enumerable#map` を使わずに Array のそれぞれの要素を 2倍した、新しい Array を作ってみよう。

```ruby
a = [1, 2, 3, 5]

result = []
a.each do |i|
    ...

a       # => [1, 2, 3, 5]
result  # => [2, 4, 6, 10]
```

#### 解答例: `map` がないなら `map!` を使えばいいじゃない
```ruby
result = a.clone
result.map!{|i| i * 2}

a                               # => [1, 2, 3, 5]
result                          # => [2, 4, 6, 10]
```

`Array#map!` も使用禁止です。

#### 解答例: `map` の別名は `collect`
```ruby
result = a.collect{|i| i * 2}

a                               # => [1, 2, 3, 5]
result                          # => [2, 4, 6, 10]
```

もちろん `Enumerable#collect` も使用禁止。

#### 解答例: `map` を実装してみた
```ruby
module RubyKansai
  refine Array do
    def _map_
      unless block_given?
        to_enum __callee__
      else
        inject([]) do |result, item|
          result << yield(item)
        end
      end
    end
  end
end

using RubyKansai
result = a._map_{|i| i * 2}

a                               # => [1, 2, 3, 5]
result                          # => [2, 4, 6, 10]
```

……そうじゃない

### 演習問題 2
`Enumerable#select` を使わずに Array から奇数の要素だけを抽出してみよう。

```ruby
a = [1, 2, 3, 5]

result = []
a.each do |i|
    ...

a       # => [1, 2, 3, 5]
result  # => [1, 3, 5]
```

#### 解答例: `select` がないなら `select!` を (ry
```ruby
result = a.clone
result.select!{|i| i.odd?}

a                               # => [1, 2, 3, 5]
result                          # => [1, 3, 5]
```

`Array#select!` も使用禁止!

#### 解答例: `select` の別名は `find_all`
```ruby
result = a.find_all{|i| i.odd?}

a                               # => [1, 2, 3, 5]
result                          # => [1, 3, 5]
```

`Enumerable#find_all` も使用禁止!!

#### 解答例: `select` を実装してみた(ｷﾘｯ
```ruby
module RubyKansai
  refine Array do
    def _select_
      unless block_given?
        to_enum __callee__
      else
        each_with_object([]) do |item, result|
          result << item if yield(item)
        end
      end
    end
  end
end

using RubyKansai
result = a._select_{|i| i.odd?}

a                               # => [1, 2, 3, 5]
result                          # => [1, 3, 5]
```

だから、そうじゃない!

### 演習問題 3
`Enumerable#inject` を使わずに Array の要素を合計してみよう。

```ruby
a = [1, 2, 3, 5]

result = 0
a.each do |i|
    ...

a       # => [1, 2, 3, 5]
result  # => 11
```

#### 解答例: `inject` の別名は `reduce`
```ruby
result = a.reduce{|m, i| m + i}

a                               # => [1, 2, 3, 5]
result                          # => 11
```

`reduce` も (ry

#### 解答例: `inject` を (ry
```ruby
module RubyKansai
  refine Array do
    def _inject_(*args, &block)
      block = args.pop.to_proc if args.last.instance_of? Symbol
      item = each
      begin
        result = args.empty?? item.next: args.shift
        loop do
          result = block.call(result, item.next)
        end
        result
      rescue StopIteration
        nil
      end
    end
  end
end

using RubyKansai
result = a._inject_{|m, i| m + i}

a                               # => [1, 2, 3, 5]
result                          # => 11
```

そうじゃない!!

#### 解答例: 無理矢理に別解
```ruby
def _inject_(ary)
  case ary.size
  when 0 then nil
  when 1 then ary.first
  else _inject_([ary[0] + ary[1]] + ary[2..-1])
  end
end

result = _inject_(a)

a                               # => [1, 2, 3, 5]
result                          # => 11
```

- Array が空なら `nil` を返す
- 要素が 1つなら、それを返す
- 要素が 2つ以上なら、最初の 2つを足し、3つ目以降の要素と処理を繰り返す

### 演習問題 4
1. `Enumerable#map` を使って Array の各要素を 2倍してみよう。
1. `Enumerable#select` を使って Array から奇数の要素だけを抽出してみよう。
1. `Enumerable#inject` を使って Array の要素を合計してみよう。

```ruby
a = [1, 2, 3, 5]

a.map ...     # => [2, 4, 6, 10]
a.select ...  # => [1, 3, 5]
a.inject ...  # => 11
```

### 演習問題 5
与えられた文字列から

1. 単語の出現回数
1. 文字の出現回数

を数えてみよう。
