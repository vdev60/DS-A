# frozen_string_literal: true

class Node
  attr_accessor :next, :data

  def initialize(data)
    @data = data
    @next = nil
  end
end

class LinkedList
  attr_reader :head, :tail, :length

  def initialize(value)
    node =  Node.new(value)
    @head = node
    @tail = node
    @length = 1
  end

  def get(index)
    return nil if index.negative? || index > @length

    current = @head
    (0...index).each do |_i|
      current = current.next
    end

    current
  end

  def append(value)
    node = Node.new(value)

    if @head
      @tail.next = node
    else
      @head = node
    end
    @tail = node

    @length += 1
    true
  end

  def prepend(value)
    node = Node.new(value)

    if @length.zero?
      @head = node
      @tail = node
    else
      node.next = @head
      @head = node
    end

    @length += 1
    true
  end

  def pop_first
    return nil if @length.zero?

    temp = @head
    @head = @head.next
    @length -= 1
    temp.next = nil

    @tail = nil if @length.zero?

    temp
  end

  def pop
    return nil if @length.zero?

    temp, prev = @head

    while temp.next
      prev = temp
      temp = temp.next
    end

    @tail = prev
    @tail.next = nil
    @length -= 1

    if @length.zero?
      @head = nil
      @tail = nil
    end

    temp.data
  end

  def remove(index)
    return nil if index.negative? || index > @length

    return pop_first if index.zero?

    return pop if index == @length

    prev = get(index - 1)

    temp = prev.next
    prev.next = temp.next
    temp.next = nil
    @length -= 1

    temp
  end

  def set_value(index, value)
    temp = get(index)

    return false unless temp

    temp.data = value
    true
  end

  def insert(index, value)
    return false if index.negative? || index > @length

    return prepend(value) if index.zero?

    return append(value) if index == @length

    new_node = Node.new(value)
    temp = get(index - 1)

    new_node.next = temp.next
    temp.next = new_node
    @length += 1

    true
  end

  def reverse
    return self if @length.zero? || @length == 1

    temp = @head
    @head = @tail
    @tail = temp
    before = nil
    temp.next

    (0...@length).each do |_i|
      after = temp.next
      temp.next = before
      before = temp
      temp = after
    end

    self
  end

  def print_list
    current = @head
    while current
      p current.data
      current = current.next
    end
  end
end
