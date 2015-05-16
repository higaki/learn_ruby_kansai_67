s = "No Ruby, No Life."

puts s.chars
  .each_with_object(Hash.new{|h, k| h[k] = 0}){|w, h| h[w] += 1}
  .sort_by{|w, n| [-n, w]}
  .map{|w, n| "%8d %s" % [n, w]}

# >>        3  
# >>        2 N
# >>        2 o
# >>        1 ,
# >>        1 .
# >>        1 L
# >>        1 R
# >>        1 b
# >>        1 e
# >>        1 f
# >>        1 i
# >>        1 u
# >>        1 y
