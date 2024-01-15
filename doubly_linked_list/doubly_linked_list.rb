# frozen_string_literal: true

class Node
  attr_accessor :next, :data, :prev

  def initialize(data)
    @data = data
    @next = nil
    @prev = nil
  end
end

class DoublyLinkedList
  attr_reader :length, :head, :tail

  def initialize(value)
    node = Node.new(value)
    @head = node
    @tail = node
    @length = 1
  end

  def print_list
    current = @head
    while current
      p current.data
      current = current.next
    end
  end

  def append(value)
    node = Node.new(value)

    if @tail
      @tail.next = node
      node.prev = @tail
    else
      @head = node
    end
    @tail = node

    @length += 1
    true
  end

  def pop
    return nil if @length.zero?

    temp = @tail

    if @length == 1
      @tail = nil
      @head = nil
    else
      @tail = @tail.prev
      @tail.next = nil
      temp.prev = nil
    end

    @length -= 1
    temp
  end

  def pop_first
    return nil if @length.zero?

    temp = @head

    if @length == 1
      @head = nil
      @tail = nil
    else
      @head = @head.next
      @head.prev = nil
      temp.next = nil
    end

    @length -= 1
    temp
  end

  def prepend(value)
    node = Node.new(value)

    if @length.zero?
      @head = node
      @tail = node
    else
      node.next = @head
      @head.prev = node
      @head = node
    end

    @length += 1
    true
  end

  def get(index)
    return nil if index >= @length || index.negative?

    mid = @length / 2

    # it's great to choose where to start a search
    if index < mid
      temp = @head
      (0...index).each do |_|
        temp = temp.next
      end
    else
      temp = @tail

      (@length - index - 1).times do |_|
        temp = temp.prev
      end
    end

    temp
  end

  def set_value(index, value)
    temp = get(index)

    return false unless temp

    temp.data = value
    true
  end

  def insert(index, value)
    return false if index > @length || index.negative?

    return prepend(value) if index.zero?

    return append(value) if index == @length

    new_node = Node.new(value)

    before = get(index - 1)
    after = before.next

    new_node.next = after
    new_node.prev = before

    before.next = new_node
    after.prev = new_node

    @length += 1
    true
  end

  def remove(index)
    return false if index >= @length || index.negative?

    return pop_first(index) if index.zero?

    return pop(index) if index == @length

    temp = get(index)

    temp.prev.next = temp.next
    temp.next.prev = temp.prev

    temp.prev = nil
    temp.next = nil

    @length -= 1
    temp
  end

  def swap_first_last
    return if @head == nil || @head == @tail
  
    @tail.data, @head.data = @head.data, @tail.data
  end
end
