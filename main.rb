require_relative 'lib/tree'
require_relative 'lib/node'

array = Array.new(15) { rand(1..100) }
p array

btree = Tree.new
btree.build_tree(array)
btree.pretty_print
btree.insert(btree.root, 150)
btree.insert(btree.root, 120)
btree.insert(btree.root, 145)
btree.pretty_print
p btree.balanced?(btree.root)
btree.rebalance
btree.pretty_print
p btree.balanced?(btree.root)

p btree.inorder(btree.root)
p btree.preorder(btree.root)
p btree.postorder(btree.root)

nodeX = btree.find(btree.root, 150)
p nodeX.data
p btree.depth(btree.root, nodeX)
btree.delete(btree.root, 150)
btree.pretty_print
p btree.inorder(btree.root)
