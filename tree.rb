class Tree
  def initialize(array)
    @root = nil
  end

  def build_tree(array)
    array.sort!.uniq!
    array_to_BST(array, 0, array.length - 1)
  end

  def array_to_BST(array, start_index, end_index)
    return null if start_index > end_index

    mid = start_index + ((end_index - start_index) / 2).floor
    root_node = Node.new(array[mid])

    root_node.left = array_to_BST(array, start_index, mid - 1)
    root_node.right = array_to_BST(array, mid + 1, end_index)

    root_node
  end

  def pretty_print(node = @root, prefix = '', is_left = true)
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
