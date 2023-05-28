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

  def delete(value, root = @root)
    # 3 cases:
    # - delete a node that is a 'leaf'
    #   - just remove the node from the tree
    # - delete a node that has only one child
    #   - replace the node by the child node (the entire object)
    # - delete a node that has two children
    #   - look at its right child
    #     - from this right child, look its left child until left child is nil
    #     - replace the node to be delete by the last left child of the right child of that node
    return root if root.nil?

    if value < root.data
      root.left = delete(value, root.left)
    elsif root.data < value
      root.right = delete(value, root.right)
    elsif root.left.nil? && root.right.nil?
      root = nil
    elsif root.left.nil?
      root = root.right
    elsif root.right.nil?
      root = root.left
    end
    root
  end

  def pretty_print(node = @root, prefix = '', is_left = true) # rubocop:disable Style/OptionalBooleanParameter
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
