# frozen_string_literal: true

module QueueOnLinkedList
  class Node
    attr_accessor :data, :next

    def initialize(data)
      @data = data
      @next = nil
    end
  end

  class Queue
    attr_reader :first, :last, :length

    def initialize(data)
      node = Node.new(data)
      @first = node
      @last = node

      @length = 1
    end

    def enqueue(data)
      node = Node.new(data)

      if @first.nil?
        self.first = node
      else
        self.last.next = node
      end
      self.last = node

      self.length += 1
      node
    end

    def dequeue
      return nil if @length.zero?

      temp = @first

      if @length == 1
        self.first = nil
        self.last = nil
      else
        self.first = @first.next
        temp.next = nil
      end

      self.length -= 1
      temp
    end

    def print_list
      temp = @first

      while temp
        p temp.data
        temp = temp.next
      end
    end

    private

    attr_writer :first, :last, :length
  end
end

q1 = Queue.new(1)
q1.enqueue(2)
q1.enqueue(3)

q1.dequeue
q1.dequeue

q1.print_list
