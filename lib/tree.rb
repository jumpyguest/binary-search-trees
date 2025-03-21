class Tree
  attr_reader :root

  def initialize
    @root = nil
  end

  def build_tree(array)
    array.sort!.uniq!
    @root = array_to_BST(array, 0, array.length - 1)
  end

  # recursive function to construct BST
  def array_to_BST(array, start_index, end_index)
    return nil if start_index > end_index

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

  # Inserts a new node with the given data
  def insert(root_node, data)
    return Node.new(data) if root_node.nil?

    # duplicates not allowed
    return root_node if root_node.data == data

    root_node.left = insert(root_node.left, data) if data < root_node.data
    root_node.right = insert(root_node.right, data) if data > root_node.data
    root_node
  end

  # mainly works when the right child is not empty, which is  the case we need in BST
  def get_successor(curr)
    curr = curr.right
    # NOTE: not using until loop so as to avoid accessing a nil.left access
    # false first condition terminates the while loop immediately!
    curr = curr.left while !curr.nil? && !curr.left.nil?
    curr
  end

  # This function deletes a given data from the given BST and returns the modified root of the
  # BST (if it is modified).
  def delete(root_node, data)
    # base case
    return root_node if root_node.nil?

    if root_node.data > data
      root_node.left = delete(root_node.left, data)
    elsif root_node.data < data
      root_node.right = delete(root_node.right, data)
    else
      # if root matches with the data

      # case when root has 0 children or only right child
      return root_node.right if root_node.left.nil?

      # when root only has left child
      return root_node.left if root_node.right.nil?

      # when both children are present
      successor = get_successor(root_node)
      root_node.data = successor.data
      root_node.right = delete(root_node.right, successor.data)
    end
    root_node
  end

  # returns the node with the given data. Returns nil if not found
  def find(root_node, data)
    return nil if root_node.nil?

    if data < root_node.data
      find(root_node.left, data)
    elsif data > root_node.data
      find(root_node.right, data)
    else
      root_node
    end
  end

  # traverses block with the specified root node in breadth-first level order and
  # returns an array of node values
  def level_order(root_node, &block)
    queue = []
    nodes_array = []

    queue.push(root_node)
    until queue.empty?
      current_node = queue.shift
      block_given? ? yield(current_node) : nodes_array << current_node.data
      queue.push(current_node.left) unless current_node.left.nil?
      queue.push(current_node.right) unless current_node.right.nil?
    end
    nodes_array
  end

  def inorder(root_node)
    array = []
    return array if root_node.nil?

    array = array.union(inorder(root_node.left))
    array << root_node.data
    array = array.union(inorder(root_node.right))
  end

  def preorder(root_node)
    array = []
    return array if root_node.nil?

    array << root_node.data
    array = array.union(preorder(root_node.left))
    array = array.union(preorder(root_node.right))
  end

  def postorder(root_node)
    array = []
    return array if root_node.nil?

    array = array.union(postorder(root_node.left))
    array = array.union(postorder(root_node.right))
    array << root_node.data
  end

  def height(node)
    num_edges = 0
    return num_edges - 1 if node.nil?

    num_edges += 1
    num_edges_left = height(node.left)
    num_edges_right = height(node.right)
    num_edges += num_edges_left >= num_edges_right ? num_edges_left : num_edges_right
  end

  def depth(root_node, node)
    num_edges = 0
    return num_edges if root_node.nil?

    num_edges += 1
    if node < root_node
      num_edges += depth(root_node.left, node)
    elsif node > root_node
      num_edges += depth(root_node.right, node)
    else
      num_edges - 1
    end
  end

  def balanced?(root_node)
    height_left = height(root_node.left)
    height_right = height(root_node.right)
    p "heightleft: #{height_left}"
    p "heightright: #{height_right}"
    (height_left - height_right).abs <= 1
  end

  def rebalance
    array = level_order(@root)
    build_tree(array)
  end
end
