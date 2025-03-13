require_relative 'lib/tree'
require_relative 'lib/node'

# array = Array.new(15) { rand(1..100) }
array = [50, 70, 30, 20, 40, 80, 60]
p array

btree = Tree.new
btree.build_tree(array)
btree.pretty_print
p btree.balanced?(btree.root)
p btree.postorder(btree.root)
btree.insert(btree.root, 150)
btree.insert(btree.root, 120)
btree.insert(btree.root, 145)
btree.pretty_print
p btree.balanced?(btree.root)
btree.rebalance
# btree.pretty_print
