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

  def print_data_map
    @data_map.each_index do |k|
      puts "#{k} : #{@data_map[k]}"
    end
  end

  def set_item(key, value)
    index = hash(key)
    @data_map[index] = [] if @data_map[index].nil?
    @data_map[index].push([key, value])
  end

  def get_item(key)
    index = hash(key)
    return nil if @data_map[index].nil?

    @data_map[index].each do |k, value|
      return value if k == key
    end
  end

  def keys
    keys_list = []
    @data_map.each do |i|
      next if i.nil?

      i.each do |k, _v|
        keys_list.push(k)
      end
    end
    keys_list
  end
end
