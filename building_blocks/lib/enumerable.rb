module Enumerable

  def my_each
    self.size.times {|i| yield(self[i]) } if block_given?
    self
  end

  def my_each_with_index
    self.size.times {|i| yield(self[i], i) } if block_given?
    self
  end

  def my_select
    result = []
    self.my_each {|x| result << x if yield(x) == true } if block_given?
    result
  end

  def my_all?
    if block_given?
      self.my_each {|x| return false if yield(x) == false }
    else
      self.my_each {|x| return false if x == false }
    end
    true
  end

  def my_any?
    if block_given?
      self.my_each {|x| return true if yield(x) == true }
    else
      self.my_each {|x| return true if x == true }
    end
    false
  end

  def my_none?
    !self.my_any? {|x| yield(x) }
  end

  def my_count
    self.my_select {|x| yield(x) }.size
  end

  def my_map(some_proc)
    result = []
    if block_given?
      self.my_each {|x| result << some_proc.call(yield(x)) }
    else
      self.my_each {|x| result << some_proc.call(x) }
    end
    result
  end

  def my_inject(index_start=0)
    obj = self[index_start..self.size]
    obj.my_each_with_index do |x, i|
      if i == 0
        @result = x
      else
        @result = yield(@result, x)
      end
    end
    @result
  end

  def multiply_els
    self.my_inject {|product, x| product * x }
  end

end
