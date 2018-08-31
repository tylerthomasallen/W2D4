require 'byebug'


#factiorial (perms) + n

def first_anagram?(str, target)
  perms = str.split('').permutation.to_a
  
  perms.each do |perm|
    return true if perm.join('') == target 
  end
  
  false
end

# p first_anagram?('elvis', 'lives')

# O(n^2)
def second_anagram?(str, target)
  arr = target.split('')
  str.each_char do |char|
    idx = arr.index(char)
    return false if idx == nil
    arr.delete_at(idx)
  end
  
  arr == []
end

# p second_anagram?('hella', 'hello')

# O(n^2) ???? or avg case O(n log n)
def third_anagram?(str, target)
  str.chars.sort == target.chars.sort
end

# p third_anagram?('hella', 'hello')

# O(n) + O(m) 
def fourth_anagram?(str, target)
  str_hash = Hash.new(0)
  target_hash = Hash.new(0)
  
  str.each_char do |char| 
    str_hash[char] += 1
  end
  
  target.each_char do |char| 
    target_hash[char] += 1
  end
  
  str_hash == target_hash

end 

# helps with space not so much with time??
def bonus(str, target)
  chars = Hash.new(0)
  
  str.each_char do |char| 
    chars[char] += 1
  end
  
  target.each_char do |char| 
    chars[char] -= 1
  end
  
  chars.values.all? { |el| el == 0}
  
end

# p fourth_anagram?('elvis', 'lives')
p bonus('elvis', 'lives')
