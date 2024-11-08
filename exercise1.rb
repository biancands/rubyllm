def palindrome?(string)
  cleaned_string = string.downcase.gsub(/\W/, '')
  cleaned_string == cleaned_string.reverse
end

def count_words(string)
  words = string.downcase.scan(/\b\w+\b/)
  word_count = Hash.new(0)
  words.each { |word| word_count[word] += 1 }
  word_count
end

# Examples
puts palindrome?("A man, a plan, a canal -- Panama") # => true
puts palindrome?("Madam, I'm Adam!") # => true
puts palindrome?("Abracadabra") # => false

# Examples
puts count_words("A man, a plan, a canal -- Panama") # => {'a' => 3, 'man' => 1, 'canal' => 1, 'panama' => 1, 'plan' => 1}
puts count_words("Doo bee doo bee doo") # => {'doo' => 3, 'bee' => 2}
