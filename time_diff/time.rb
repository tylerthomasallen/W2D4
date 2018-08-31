require 'byebug'

# polynomial / quadratic because goes n * n times -> O(n2)
def bubble(list)
  return nil if list.empty?
  sorted = false 
  
  until sorted
    sorted = true 
    
    (list.length - 1).times do |idx|
      
      if list[idx] > list[idx + 1]
        list[idx], list[idx + 1] = list[idx + 1], list[idx]
        sorted = false
      end 
    end 
  end
  
  list[0]
end 

list = [ 3, 1, 2 ]
# p bubble(list)

#linear 0(n) - one loop
def simple_loop(list)
  smallest = list.first
  
  (1...list.length).each do |idx|
    smallest = list[idx] if list[idx] < smallest
  end
  
  smallest
end

p simple_loop(list)

#LARGEST CONTIGUOUS SUB-SUM

# k^n + n^2 + 1
def large_sum_phase_one(list)
  subs = subsets(list)
  result = []
  
  subs[1..-1].each do |sub|
    result << sub.reduce(:+)
  end
  
  result.max
end

# Array.new.tap {|a| subs[1..-1].each do |sub|
#   a << sub.reduce(:+) }
# end.max 
# O(k^n)
def subsets(list)
  return [[]] if list.empty?
  subs = subsets(list[0..-2])
  p subs.concat(subs.map { |el| el += [list.last]})
end 

p large_sum_phase_one(list)

# n^2
# def subby(list)
#   result = []
#   list.length.downto(1) do |idx|
#     list.each_cons(idx) {|a| result << a }
#   end 
#   result 
# end 
# 
# a = [1, 2, 3]
# p subby(a)

# def optimized_sub(list)
#   hash = Hash.new {|h, k| h[k] = []}
# 
#     list.each_index do |idx| 
#     hash[idx] << list[idx]
#   end 
# 
#   i = 0
#   hash_length = hash.length 
#   while i < hash_length 
#     hash[i + hash.length] << hash[i] + hash[i + 1]
#     i += 1
#   end 
# 
#   hash 
# end

# p optimized_sub(list)

def optimize(list)
  high_score = list.first 
  current_score = high_score
  
  if list.all? {|el| el < 0 }
    high_score = list.max 
  else 
    list[1..-1].each do |el|
      current_score += el 
      if current_score < 0
        current_score = 0
      end 
      
      high_score = current_score unless current_score < high_score
    end 
  end 
  
  high_score 
end 

list1 = [2, 3, -6, 7, -6, 7] 
p optimize(list1)



