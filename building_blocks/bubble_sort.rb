def bubble_sort(array)

  swap = Proc.new {|i| array[i], array[i+1] = array[i+1], array[i] }

  n = array.length-1
  noswap = false

  until noswap
    noswap = true
    n.times do |i|
      if array[i] > array[i+1]
        swap.call(i)
        noswap = false
      end
    end
  end

p array

end

bubble_sort([4,3,78,2,0,2])
