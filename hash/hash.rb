# frozen_string_literal: true

class HashTable
  def initialize(size = 7)
    @data_map = Array.new(size, nil)
  end

  def hash(key)
    my_hash = 0
    key.each_char do |letter|
      my_hash = (my_hash + letter.ord * 23) % @data_map.size
    end
    my_hash
  end
end
