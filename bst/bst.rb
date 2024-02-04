# frozen_string_literal: true

class Node
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = nil
    @right = nil
  end
end

class BinarySearchTree
  def initialize
    @root = nil
  end

  def insert(value)
    node = Node.new(value)

    unless @root
      @root = node
      return true
    end

    temp = @root
    loop do
      return false if value == temp.value

      if value < temp.value
        if temp.left.nil?
          temp.left = node
          return true
        end
        temp = temp.left
      else
        if temp.right.nil?
          temp.right = node
          return true
        end
        temp = temp.right
      end
    end
  end

  def contain?(value)
    temp = @root
    until temp.nil?
      if value < temp.value
        temp = temp.left
      elsif value > temp.value
        temp = temp.right
      else
        return true
      end
    end
    false
  end
end
