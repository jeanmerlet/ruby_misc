def fib(n)
  fib0, fib1 = 1, 1
  n.times do
    print "#{fib0} "
    fib0, fib1 = fib1, fib0 + fib1
  end
end

def fib_rec(n, sequence = [1, 1])
  return sequence[0] if n == 1
  return sequence.join(" ") if n == 2
  sequence << sequence[-2] + sequence[-1]
  fib_rec(n-1, sequence)
end

fib(10)
puts ""
print fib_rec(10)
puts ""
