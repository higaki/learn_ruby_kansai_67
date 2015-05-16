a = [1, 2, 3, 5]

result = []
a.each do |i|
  result << i * 2
end

a       # => [1, 2, 3, 5]
result  # => [2, 4, 6, 10]
