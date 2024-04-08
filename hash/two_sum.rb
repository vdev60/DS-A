  def two_sum(nums, target)
  groupd = {}
  nums.each_with_index do |num, index|
    completed = target - num
    if groupd.has_key?(completed)
      return [nums.index(completed), index]
    end
    
    groupd[num] = index
  end
  []
end

# tests
def two_sum_test(input, expected)
  result = two_sum(*input)
  if result == expected
    puts 'Test Passed'
  else
    puts 'Test Faild'
    puts "Current resutl -> #{result}"
    puts "Expected result ->  #{expected}"
  end
end

two_sum_test([[5, 1, 7, 2, 9, 3], 10], [1, 4])
