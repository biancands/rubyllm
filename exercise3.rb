def combine_anagrams(words)
  anagrams = Hash.new { |hash, key| hash[key] = [] }

  words.each do |word|
    key = word.downcase.chars.sort.join
    anagrams[key] << word
  end

  anagrams.values
end

# Example
input = ['cars', 'for', 'potatoes', 'racs', 'four', 'scar', 'creams', 'scream']
output = combine_anagrams(input)
puts output.inspect
# => [["cars", "racs", "scar"], ["for"], ["potatoes"], ["four"], ["creams", "scream"]]