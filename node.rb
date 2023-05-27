# frozen_string_literal: true

# class representing a node in a binary search tree data structure
class Node
  include Comparable

  attr_accessor :data, :left, :right

  def initialize(data = nil, left = nil, right = nil)
    @data = data
    @left = left
    @right = right
  end

  def <=>(other)
    return nil unless other.instance_of?(Node)

    data <=> other.data
  end
end
