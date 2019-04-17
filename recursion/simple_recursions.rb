def factorial(n)
  n == 0 ? 1 : n * factorial(n-1)
end

def is_palindrome?(string)
  if string.length <= 1
    true
  elsif string[0] == string[-1]
    is_palindrome?(string[1..-2])
  else
    false
  end
end

def bottles_of_beer(n)
  if n == 1
    puts "1 bottle of beer on the wall, 1 bottle of beer..."
    puts "take one down, pass it around, no more bottles of beer on the wall!"
  else
    puts "#{n} bottles of beer on the wall, #{n} bottles of beer..."
    puts "take one down, pass it around, #{n-1} bottles of beer on the wall."
    bottles_of_beer(n-1)
  end
end

def fibonacci_value(n)
  n <= 2 ? 1 : fibonacci_value(n-2) + fibonacci_value(n-1)
end

def completely_flatten(array)
  if array == array.flatten
    array
  else
    array.flatten!
    completely_flatten(array)
  end
end

puts factorial(5)
puts is_palindrome?("racecar")
bottles_of_beer(5)
puts fibonacci_value(10)
p completely_flatten([[[[1, 2], [3]], [4]], [5, 6], [7, 8, 9]])
