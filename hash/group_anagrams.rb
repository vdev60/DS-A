def group_anagrams(strings)
  grouped_strings = Hash.new {|hash,k| hash[k] = [] } 

  strings.each do |str|
    sorted_str = str.chars.sort.join("")
    grouped_strings[sorted_str] << str
  end

  grouped_strings.values
end

inputs = ["eat", "tea", "tan", "ate", "nat", "bat"]

# tests
def group_anagrams_test(input, expected)
  result = group_anagrams(input)
  if result == expected
    puts 'Test Passed'
  else
    puts 'Test Faild'
    puts "Current resutl -> #{result}"
    puts "Expected result ->  #{expected}"
  end
end

group_anagrams_test(inputs, [["eat", "tea", "ate"], ['tan','nat'], ['bat']])
