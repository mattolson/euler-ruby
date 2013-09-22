def first_attempt
  sum = 0
  (1...1000).each do |val|
    sum += val if val % 3 == 0 || val % 5 == 0
  end
  puts sum
end

def optimized
  # This is a sum of two arithmetic series, the multiples of 3 and the multiples of 5
  # Figure out how many multiples of three there are and where it ends, same for five,
  # and add them together, but we must account for double counting of multiples of 15.
  #
  # sum of arithmetic series = n/2 * (a + z) where n is the number of terms,
  # a is the first term, and z is the last term

  multiples_of_three = 333 * (3 + 999) / 2
  multiples_of_five = 199 * (5 + 995) / 2
  multiples_of_fifteen = 66 * (15 + 990) / 2
  puts multiples_of_three + multiples_of_five - multiples_of_fifteen
end

def benchmark(m)
  start = Time.now
  self.send(m)
  finish = Time.now
  puts "call to '#{m}' took #{(finish - start) * 1000}ms"
end

benchmark :first_attempt
benchmark :optimized
