# frozen_string_literal: true

require './tree'

tree = Tree.new(Array.new(15) { rand(1..100) })
puts "Balanced tree: #{tree.balanced?}\n\n"
tree.pretty_print

puts "\nLevel order elements: #{tree.level_order}"
puts "\nPreorder order elements: #{tree.preorder}"
puts "\nInorder elements: #{tree.inorder}"
puts "\nPostorder order elements: #{tree.postorder}"

10.times { tree.insert(rand(100..200)) }
puts "\nBalanced tree: #{tree.balanced?}\n\n"
tree.pretty_print

tree.rebalance
puts "\nBalanced tree: #{tree.balanced?}\n\n"
tree.pretty_print

puts "\nLevel order elements: #{tree.level_order}"
puts "\nPreorder order elements: #{tree.preorder}"
puts "\nInorder elements: #{tree.inorder}"
puts "\nPostorder order elements: #{tree.postorder}"
