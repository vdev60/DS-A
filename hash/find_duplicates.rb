# frozen_string_literal: true

def find_duplicates(nums)
  duplicates = {}
  dublicates_array = []

  nums.each do |i|
    duplicates[i] = duplicates.fetch(i, 0) + 1
  end

  duplicates.each do |k, v|
    dublicates_array << k if v > 1
  end
  dublicates_array
end

# tests
def find_duplicates_test(input, expected)
  if find_duplicates(input) == expected
    p 'Test Passed'
  else
    p "Test Faild. The result should be #{expected}"
  end
end

find_duplicates_test([-1, -2, -3, -1], [-1])
find_duplicates_test([1, 1, 1, 1], [1])
find_duplicates_test([1, 2, 3, 4], [])
