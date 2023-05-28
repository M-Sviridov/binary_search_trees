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
tree.delete(50)
puts 'After deleting 50:'
tree.pretty_print
