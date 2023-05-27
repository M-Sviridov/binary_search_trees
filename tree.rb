# frozen_string_literal: true

require './node'

# class representing a node in a binary search tree data structure
class Tree
  attr_accessor :root

  def initialize(array)
    @array = array.sort.uniq
    @root = build_tree(@array)
  end

  def build_tree(array, start = 0, finish = array.size - 1)
    return nil if start > finish

    mid = (start + finish) / 2
    tree_node = Node.new(array[mid])

    tree_node.left = build_tree(array, start, mid - 1)
    tree_node.right = build_tree(array, mid + 1, finish)

    tree_node
  end

  def insert(value, root = @root)
    return Node.new(value) if root.nil?

    if value == root.data
      root.data
    elsif value < root.data
      root.left = insert(value, root.left)
    else
      root.right = insert(value, root.right)
    end
    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true) # rubocop:disable Style/OptionalBooleanParameter
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
