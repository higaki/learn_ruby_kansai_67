s = "No Ruby, No Life."

puts s.scan(/\p{Word}+/)
  .each_with_object(Hash.new{|h, k| h[k] = 0}){|w, h| h[w] += 1}
  .sort_by{|w, n| [-n, w]}
  .map{|w, n| "%8d %s" % [n, w]}

# >>        2 No
# >>        1 Life
# >>        1 Ruby
