a = [1, 2, 3, 5]

result = []
a.each do |i|
  if i.odd?
    result << i
  end
end

a       # => [1, 2, 3, 5]
result  # => [1, 3, 5]
