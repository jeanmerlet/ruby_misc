class Node
  attr_accessor :value, :parent, :left, :right

  def initialize(value, parent = nil, left = nil, right = nil)
    @value = value
    @parent = parent
    @left = left
    @right = right
  end
end

def build_binary_tree(array, parent = nil)
  return nil if array.nil?
  return Node.new(array[0], parent) if array.size == 1

  value = array.delete_at(0)
  first_half, second_half = array.each_slice((array.size/2.0).round).to_a

  node = Node.new(value, parent)
  node.left = build_binary_tree(first_half, node)
  node.right = build_binary_tree(second_half, node)

  node
end

def breadth_first_search(tree, value)
  node = tree
  queue = [node]

  until queue.empty? || value == node.value

    if !queue.include?(node.left) && !node.left.nil?
      queue << node.left
    elsif !queue.include?(node.right) && !node.right.nil?
      queue << node.right
    else
      queue.delete_at(0)
      node = queue.first
    end
    
  end

  node = nil if queue.empty?
  node
end

def depth_first_search(tree, value)
  node = tree
  stack = [node]
  visited = [node]

  until stack.empty? || value == node.value

    if !visited.include?(node.left) && !node.left.nil?
      node = node.left
      stack << node
      visited << node
    elsif !visited.include?(node.right) && !node.right.nil?
      node = node.right
      stack << node
      visited << node
    else
      stack.delete_at(-1)
      node = stack.last
    end
  end

  node = nil if stack.empty?
  node
end

def recursive_dfs(tree, value)
  return tree if value == tree.value

  left = recursive_dfs(tree.left, value) unless tree.left.nil?
  right = recursive_dfs(tree.right, value) unless tree.right.nil?

  left || right
end

tree = build_binary_tree([1, 4, 32, 523, 3, 17, 25, 3434, 123, 53, 43, 134, 8])

p breadth_first_search(tree, 8)
p breadth_first_search(tree, "string")

p depth_first_search(tree, 8)
p depth_first_search(tree, "string")

p recursive_dfs(tree, 8)
p recursive_dfs(tree, "string")
