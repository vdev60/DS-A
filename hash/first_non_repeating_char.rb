# frozen_string_literal: true

def first_non_repeating_char(str)
  return nil if str.strip.empty? && str.length > 1

  counter_first_char = {}

  str.each_char do |char|
    counter_first_char[char] = counter_first_char.fetch(char, 0) + 1
  end

  str.each_char do |char|
    return char if counter_first_char[char] == 1
  end
  nil
end

# tests
def first_non_repeating_char_test(input, expected)
  if first_non_repeating_char(input) == expected
    p 'Test Passed'
  else
    p "Test Faild. The result should be #{expected}"
  end
end

first_non_repeating_char_test('test', 'e')
first_non_repeating_char_test('good', 'g')
first_non_repeating_char_test('aabbcct', 't')
first_non_repeating_char_test('ttrr', nil)
