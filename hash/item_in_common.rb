# frozen_string_literal: true

def item_in_common(list_1, list_2)
  empty_hash = {}

  list_1.each { |i| empty_hash[i] = true }
  list_2.each { |i| return true if empty_hash[i] }
  false
end

# tests
def item_in_common_test(input, expected)
  if item_in_common(*input) == expected
    p 'Test Passed'
  else
    p "Test Faild. The result should be #{expected}"
  end
end

item_in_common_test([[1,2,3], [4,5,6]], false)
item_in_common_test([[1,2,3], [2,4,5]], true)
item_in_common_test([[1,2,3], []], false)