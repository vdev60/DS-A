# frozen_string_literal: true

# Graph data structure representation
class Graph
  attr_accessor :adj_list

  def initialize
    @adj_list = {}
  end

  def print_vertex
    adj_list.each do |k, v|
      puts("#{k} : #{v}")
    end
  end

  def add_vertex(vertex)
    unless adj_list.value?(vertex)
      adj_list[vertex] = []
      return true
    end

    false
  end

  def add_edge(vertex1, vertex2)
    if adj_list.key?(vertex1) && adj_list.key?(vertex2)
      adj_list[vertex1] << vertex2
      adj_list[vertex2] << vertex1

      return true
    end

    false
  end

  def remove_edge(vertex1, vertex2)
    if adj_list.key?(vertex1) && adj_list.key?(vertex2)
      adj_list[vertex1].delete(vertex2)
      adj_list[vertex2].delete(vertex1)
      return true
    end

    false
  end

  def remove_vertex(vertex)
    if adj_list.key?(vertex)
      adj_list[vertex].each do |i_v|
        adj_list[i_v].delete(vertex)
      end
      adj_list.delete(vertex)
      return true
    end

    false
  end
end
