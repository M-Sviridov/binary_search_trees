# frozen_string_literal: true

require './tree'

test_array = [23, 12, 3, 4, 11, 5, 12, 24, 10, 100, 32, 424, 21]
tree = Tree.new(test_array)
puts 'Before inserting 2:'
tree.pretty_print
tree.insert(2)
puts 'After inserting 2:'
tree.pretty_print
tree.insert(13)
puts 'After inserting 13:'
tree.pretty_print
tree.insert(50)
puts 'After inserting 50:'
tree.pretty_print
tree.delete(2)
puts 'After deleting 2:'
tree.pretty_print
tree.delete(4)
puts 'After deleting 4:'
tree.pretty_print
tree.delete(11)
puts 'After deleting 11:'
tree.pretty_print
tree.delete(424)
puts 'After deleting 424:'
tree.pretty_print
tree.delete(32)
puts 'After deleting 32:'
tree.pretty_print
tree.delete(21)
puts 'After deleting 21:'
tree.pretty_print
tree.delete(5)
puts 'After deleting 5:'
tree.pretty_print
# recursive level order
puts 'Recursive level order: '
tree.level_order_rec { |node| puts node.data unless node.nil? }
p tree.level_order_rec
# iterative level order
puts 'Iterative level order: '
tree.level_order { |node| puts node.data unless node.nil? }
p tree.level_order
puts 'Inorder traversal: '
tree.inorder { |node| puts node unless node.nil? }
p tree.inorder
puts 'Preorder traversal: '
tree.preorder { |node| puts node unless node.nil? }
p tree.preorder
puts 'Postorder traversal: '
tree.postorder { |node| puts node unless node.nil? }
p tree.postorder
node = tree.find(13)
# p node
puts tree.height(node)
puts tree.depth(node)
tree.insert(400)
tree.insert(500)
tree.insert(600)
tree.pretty_print
puts tree.balanced?
tree.rebalance
tree.pretty_print
puts tree.balanced?
