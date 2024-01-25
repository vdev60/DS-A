# frozen_string_literal: true

require_relative './stack_on_array'

def is_balanced_parentheses(str)
  return true if str.empty?

  st = StackOnArray::Stack.new

  str.each_char do |c|
    if c == '('
      st.push(c)
    elsif c == ')'
      return false if st.is_empty? || st.pop != '('
    end
  end

  st.is_empty?
end

p is_balanced_parentheses('((()))')
