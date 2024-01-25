# frozen_string_literal: true

require_relative './stack_on_array'

def reverse_string(str)
  st = StackOnArray::Stack.new

  str.each_char do |c|
    st.push(c)
  end

  reversed_string = []
  reversed_string.push(st.pop) while st.size.positive?

  reversed_string.join('')
end

p reverse_string('str')
