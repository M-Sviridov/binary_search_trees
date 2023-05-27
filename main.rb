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
