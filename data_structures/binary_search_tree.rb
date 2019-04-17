class Node
  attr_accessor :value, :parent, :left, :right

  def initialize(value, parent = nil, left = nil, right = nil)
    @value = value
    @parent = parent
    @left = left
    @right = right
  end
end

def build_binary_search_tree(array, parent = nil)
  return nil if array.nil?
  return Node.new(array[0], parent) if array.size == 1

  value = array.delete_at(array.size/2)
  first_half, second_half = array.each_slice((array.size/2.0).round).to_a

  node = Node.new(value, parent)
  node.left = build_binary_search_tree(first_half, node)
  node.right = build_binary_search_tree(second_half, node)

  node
end

def add_bst_node(tree, value)
  if value < tree.value
    if tree.left.nil?
      tree.left = Node.new(value, tree)
    else
      add_node(tree.left, value)
    end
  elsif value > tree.value
    if tree.right.nil?
      tree.right = Node.new(value, tree)
    else
      add_node(tree.right, value)
    end
  end
end

def balance_bst
end

def search_bst(tree, value)
  node = tree
  
  until node.value == value || node == nil
    node = (value < tree.value ? tree.left : tree.right)
  end

  node
end
