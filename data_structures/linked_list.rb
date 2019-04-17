class LinkedList

  attr_accessor :head, :tail, :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append
    node = Node.new
    @tail.next_node = node unless @tail == nil
    @tail = node
    @head = node if @size == 0
    @size += 1
  end

  def prepend
    node = Node.new
    node.next_node = @head
    @head = node
    @tail = node if @size == 0
    @size += 1
  end

  def at(index)
    node = @head
    current_index = 0
    until current_index == index
      node = node.next_node
      current_index += 1
    end
    node
  end

  def pop
    if @size == 1
      @head, @tail = nil, nil
      @size = 0
    elsif @size > 1
      new_tail = @head
      (@size-2).times { new_tail = new_tail.next_node }
      @tail = new_tail
      @tail.next_node = nil
      @size -= 1
    end
  end

  def contains?(data)
    node = @head
    until node == nil
      return true if node.value == data
      node = node.next_node
    end
    false
  end

  def find(data)
    node = @head
    index = 0
    until node == nil
      return index if node.value == data
      node = node.next_node
      index += 1
    end
    nil
  end

  def to_s
    current_node = @head
    until current_node == nil
      print("( #{current_node.value} ) -> ")
      current_node = current_node.next_node
    end
    puts "nil"
  end

  def insert_at(index)
    if 0 <= index && index <= @size
      pointer = self.at(index)
      node = Node.new(nil, pointer)

      if index == 0
        @head = node
      else
        if index == size
          @tail.next_node = node
          @tail = node
        end
        self.at(index-1).next_node = node
      end

      @size += 1
    end
  end

  def remove_at(index)
    if 0 <= index && index <= @size
      if index == 0
        @head = @head.next_node
      elsif index == size
        self.pop
      else
        self.at(index-1).next_node = self.at(index+1)
      end
      @size -= 1
    end
  end

  class Node

    attr_accessor :value, :next_node

    def initialize(data = nil, pointer = nil)
      @value = data
      @next_node = pointer
    end

  end
end
