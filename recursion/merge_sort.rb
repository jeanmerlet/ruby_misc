def merge_sort(array)
  if array.length == 1
    array
  else
    first_half, second_half = array[0..array.size/2 - 1], array[array.size/2..-1]
    merge(merge_sort(first_half), merge_sort(second_half))
  end
end

def merge(a, b)
  sorted = []
  until a.empty? || b.empty?
    sorted << (a[0] < b[0] ? a.delete_at(0) : b.delete_at(0))
  end
  sorted + a + b
end

p merge_sort([9, 3, 1, 7, 4, 4, 5])
