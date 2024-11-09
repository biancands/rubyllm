class String
  def palindrome?
    cleaned_string = self.downcase.gsub(/\W/, '')
    cleaned_string == cleaned_string.reverse
  end
end

module Enumerable
  def palindrome?
    self.to_a == self.to_a.reverse
  end
end

# Example usage
puts "A man, a plan, a canal -- Panama".palindrome? # => true
puts "Abracadabra".palindrome? # => false
puts [1, 2, 3, 2, 1].palindrome? # => true
puts [1, 2, 3, 4, 5].palindrome? # => false