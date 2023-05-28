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

  def delete(value, node = @root) # rubocop:disable Metrics/MethodLength, Metrics/AbcSize
    return node if node.nil?

    if value < node.data
      node.left = delete(value, node.left)
    elsif node.data < value
      node.right = delete(value, node.right)
    else
      # delete node with one or no child
      return node.right if node.left.nil?
      return node.left if node.right.nil?

      # delete node with two children
      delete_node_two_children(node)
    end
    node
  end

  def delete_node_two_children(node)
    smallest_node = smallest_child_right_subtree(node)
    temp = smallest_node.data
    delete(smallest_node.data, node)
    node.data = temp
    node
  end

  def smallest_child_right_subtree(node)
    next_node = node.right
    next_node = next_node.left until next_node.left.nil?
    next_node
  end

  def find(value, node = @root)
    return nil if node.nil?
    return node if node.data == value

    if value < node.data
      node.left = find(value, node.left)
    else
      node.right = find(value, node.right)
    end
  end

  def level_order(node = @root)
    return if node.nil?

    queue = [node]
    until queue.empty?
      current_node = queue.first
      queue << current_node.left unless current_node.left.nil?
      queue << current_node.right unless current_node.right.nil?
      queue.shift
      yield(current_node)
    end
  end

  def pretty_print(node = @root, prefix = '', is_left = true) # rubocop:disable Style/OptionalBooleanParameter
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
