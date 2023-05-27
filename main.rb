# frozen_string_literal: true

require './tree'

test_array = [1, 23, 12, 3, 4, 11, 5, 12, 24, 10, 100, 32, 424, 21]
tree = Tree.new(test_array)
tree.pretty_print
