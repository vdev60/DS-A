# frozen_string_literal: true

module StackOnLinkedList
  class Node
    attr_accessor :next, :data

    def initialize(data)
      @data = data
      @next = nil
    end
  end

  class Stack
    attr_reader :top, :height

    def initialize(data)
      node = Node.new(data)
      @top = node
      @height = 1
    end

    def push(data)
      node = Node.new(data)
      node.next = @top unless @height.zero?
      self.top = node

      self.height += 1
      node
    end

    def pop
      return nil if @height.zero?

      temp = @top
      self.top = @top.next
      temp.next = nil

      self.height -= 1
      temp
    end

    def print_stack
      temp = @top

      while temp
        p temp.data
        temp = temp.next
      end
    end

    private

    attr_writer :top, :height
  end
end
