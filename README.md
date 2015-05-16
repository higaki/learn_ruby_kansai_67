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
