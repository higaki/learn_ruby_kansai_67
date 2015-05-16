a = [1, 2, 3, 5]

a.map{|i| i * 2}        # => [2, 4, 6, 10]
a.select{|i| i.odd?}    # => [1, 3, 5]
a.inject{|m, i| m + i}  # => 11
