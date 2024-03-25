require 'pry'
def subarray_sum(sub, target)
  sub_hash = { 0 => -1 }
  
  sum = 0
  sub.each_with_index do |num, index|
    sum += num
    completed = sum - target
    if sub_hash.has_key?(completed)
      starting_index = sub_hash[sum - target] + 1

      return [starting_index, index]
    end
    
    sub_hash[sum] = index
  end
  []
end


def subarray_sum_test(input, expected)
  result = subarray_sum(*input)
  if result == expected
    puts 'Test Passed'
  else
    puts 'Test Faild'
    puts "Current resutl -> #{result}"
    puts "Expected result ->  #{expected}"
  end
end


subarray_sum_test([[1, 2, 3, 4, 5], 9], [1, 3])
subarray_sum_test([[-1, 2, 3, -4, 5], 0], [0, 3])
