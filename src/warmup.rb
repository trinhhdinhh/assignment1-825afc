# Part 1 (Warm-up) Functions

def fib(n)
  # Returns the first n fibonacci numbers
  return [] if n == 0
  return [0] if n == 1
  
  result = [0, 1]
  while result.length < n
    result << result[-1] + result[-2]
  end
  
  result
end

def isPalindrome(n)
  # Returns true if n is a palindrome, false otherwise
  # Convert to string and check if it reads the same forwards and backwards
  str = n.to_s
  str == str.reverse
end

def nthmax(n, a)
  # Returns the nth largest value in array a, or nil if it doesn't exist
  return nil if n < 0 || a.empty? || n >= a.length
  
  # Sort in descending order and get the nth element (0-indexed)
  sorted = a.sort.reverse
  sorted[n]
end

def freq(s)
  # Returns the character that occurs with highest frequency in string s
  return "" if s.empty?
  
  char_count = {}
  s.each_char do |char|
    char_count[char] = (char_count[char] || 0) + 1
  end
  
  # Find the character with maximum frequency
  max_char = s[0]
  max_count = char_count[max_char]
  
  char_count.each do |char, count|
    if count > max_count
      max_count = count
      max_char = char
    end
  end
  
  max_char
end

def zipHash(arr1, arr2)
  # Returns a hash mapping corresponding elements from arr1 to arr2
  return nil if arr1.length != arr2.length
  
  result = {}
  (0...arr1.length).each do |i|
    result[arr1[i]] = arr2[i]
  end
  
  result
end

def hashToArray(hash)
  # Returns an array of arrays, each containing [key, value] pairs
  # Entries must be sorted in the same order as hash.keys
  result = []
  hash.keys.each do |key|
    result << [key, hash[key]]
  end
  
  result
end