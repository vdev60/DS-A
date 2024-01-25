# frozen_string_literal: true

module StackOnArray
  class Stack
    attr_reader :stack_list

    def initialize
      @stack_list = []
    end

    def push(value)
      @stack_list.push(value)
    end

    def pop
      @stack_list.pop unless @stack_list.empty?
    end

    def print_list
      @stack_list.each.with_index(1) do |_v, i|
        p @stack_list[-i]
      end
    end

    def peak
      @stack_list[-1]
    end

    def is_empty?
      @stack_list.empty?
    end

    def size
      @stack_list.size
    end
  end
end
