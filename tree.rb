# frozen_string_literal: true

require './node'

# class representing a Tree in a binary search tree data structure
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

  def level_order(node = @root) # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
    return if node.nil?

    queue = [node]
    array = []
    until queue.empty?
      node = queue.first
      queue << node.left unless node.left.nil?
      queue << node.right unless node.right.nil?
      queue.shift
      if block_given?
        yield(node)
      else
        array << node.data
      end
    end
    array
  end

  def level_order_rec(queue = [], node = @root, array = [], &block) # rubocop:disable Metrics/AbcSize
    return array if node.nil?

    queue << node.left unless node.left.nil?
    queue << node.right unless node.right.nil?
    if block_given?
      yield(node)
      level_order_rec(queue, queue.shift, &block)
    else
      level_order_rec(queue, queue.shift, array << node.data)
    end
  end

  def inorder(node = @root, array = [], &block) # rubocop:disable Metrics/MethodLength
    return if node.nil?

    if block_given?
      inorder(node.left, &block)
      yield(node.data)
      inorder(node.right, &block)
    else
      inorder(node.left, array)
      array << node.data
      inorder(node.right, array)
    end
    array
  end

  def preorder(node = @root, array = [], &block) # rubocop:disable Metrics/MethodLength
    return if node.nil?

    if block_given?
      yield(node.data)
      preorder(node.left, &block)
      preorder(node.right, &block)
    else
      array << node.data
      preorder(node.left, array)
      preorder(node.right, array)
    end
    array
  end

  def postorder(node = @root, array = [], &block) # rubocop:disable Metrics/MethodLength
    return if node.nil?

    if block_given?
      postorder(node.left, &block)
      postorder(node.right, &block)
      yield(node.data)
    else
      postorder(node.left, array)
      postorder(node.right, array)
      array << node.data
    end
    array
  end

  def height(node)
    # return nil if node.nil?
    return -1 if node.nil?

    [height(node.left), height(node.right)].max + 1
  end

  def pretty_print(node = @root, prefix = '', is_left = true) # rubocop:disable Style/OptionalBooleanParameter
    pretty_print(node.right, "#{prefix}#{is_left ? '│   ' : '    '}", false) if node.right
    puts "#{prefix}#{is_left ? '└── ' : '┌── '}#{node.data}"
    pretty_print(node.left, "#{prefix}#{is_left ? '    ' : '│   '}", true) if node.left
  end
end
