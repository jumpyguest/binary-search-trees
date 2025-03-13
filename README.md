# binary-search-trees

The Tree class stores a group of data items and turns them into a tree full of nodes,
with each left node being “lower” than each right node. The tree starts with the
“root node” and any node with no children is called a “leaf node”.

This repository contains solutions for the Binary Search Trees project.
1. Implementation of the Tree class and required methods.
2. Implementation of the Node class.

## Classes

### Tree
Class that represents the full binary search tree.
```ruby
class Tree
  attr_reader :root

  def initialize
    @root = nil
  end
...
```

**Methods**
- **#build_tree(array)** - takes an array of data and turns it into a balanced binary tree full of *Node* objects. Returns the level-0 root node.
- **#array_to_BST(array, start_index, end_index)** - recursive function to 
construct the binary search tree. Returns the root node.
- **#pretty_print** - prints the binary search tree.
- **#insert(root_node, data)** - inserts a new node with the given data.
Returns the root node.
- **#get_successor(curr)** - utility function to get the successor (if there is) of the node to be deleted. Returns successor node.
- **#delete(root_node, data)** - deletes a given data from the given BST and returns the modified root of the BST (if it is modified).
- **#find(root_node, data)** - returns the node with the given data. Returns nil if not found.
- **#level_order(root_node)** - traverses block with the specified root node in breadth-first level order. Returns an array of node values.
- **#inorder(root_node)** - traverses the tree from the specified root node and stores all values in an array in inorder sequence. Returns an array of values.
- **#preorder(root_node)** - traverses the tree from the specified root node and stores all values in an array in preorder sequence. Returns an array of values.
- **#postorder(root_node)** - traverses the tree from the specified root node and stores all values in an array in postorder sequence. Returns an array of values.
- **#height(node)** - accepts a node and returns its height. Height is defined as the number of edges in longest path from a given node to a leaf node.
- **#depth(root_node, node)** - accepts a node and root node and returns its depth. Depth is defined as the number of edges in path from a given node to the tree’s root node.
- **#balanced?(root_node)** - checks if the tree is balanced. A balanced tree is one where the difference between heights of left subtree and right subtree of every node is not more than 1.
- **#rebalance** - rebalances an unbalanced tree. Returns the root node.

### Node
Class that represents a node.
```ruby
class Node
  include Comparable

  attr_accessor :data, :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end
...
```

**Methods**
- **# <=>(other)** - overloaded function from Comparable module. Compares the data attribute with other's
data attribute.

## Files
- **tree.rb** - Contains implementation of the Tree class.
- **node.rb** - Contains implementation of the Node class.
- **main.rb** - driver script to test the binary search tree.