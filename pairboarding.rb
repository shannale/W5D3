def same_pattern?(pattern,str)
    pattern_hash = Hash.new(){|h,k| h[k] = []}
    pattern.each_char.with_index do |char,idx| #a, b
        pattern_hash[char] << idx #"a" => [0,3] "b" => [1,2]
    end 

    words = str.split(" ") #["dog", "cat", "cat", "dog"]
    string_hash = Hash.new(){|h,k| h[k] = []}
    words.each_with_index do |word, idx2| #"dog"
        string_hash[word] << idx2 # "dog" => [0,3] "cat" => [1,2]
    end 

    pattern_hash.values == string_hash.values 

end 


p same_pattern?(pattern = "abba", str = "dog cat cat dog")
#true

p same_pattern?(pattern = "abba", str = "dog cat cat fish")

p same_pattern?(pattern = "aaaa", str = "dog cat cat dog")
#false

p same_pattern?(pattern = "abba", str = "dog dog dog dog")
#false

# pattern_hash = Hash.new()
# string_hash = Hash.new()

# pattern.each_char.with_index do |char, idx|

# pattern Hash count 
# iterate through pattern, collect indicies 


# split string 
# pattern split 
# interate with index, index + 1 

# words = str.split(" ")

# pattern.each_char.with_index do |char1, idx1|
#     pattern.each_char.with_index do |char2, idx2|
#         if idx2 > idx1 
#             if char1 == char2 

# Problem 1:

# Given a pattern and a string str, determine if str follows the same pattern.

# Example 1

# Input: pattern = "abba", str = "dog cat cat dog"
# Output: true

# # Example 2

# Input: pattern = "abba", str = "dog cat cat fish"
# Output: false

# # Example 3

# Input: pattern = "aaaa", str = "dog cat cat dog"
# Output: false

# # Example 4

# Input: pattern = "abba", str = "dog dog dog dog"
# Output: false

# You may assume pattern contains only lowercase letters, and str contains lowercase letters that may be separated by a single space. Can you solve it in O(N) time and O(1) space?