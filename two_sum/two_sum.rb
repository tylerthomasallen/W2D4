# nested loop, 0(n^2) - quadratic

def bad_two_sum?(arr, target)
  (0...arr.length - 1).each do |i|
    j = i + 1
    (j...arr.length).each do |j|
      return true if arr[i] + arr[j] == target
    end
    
  end
  
  false
end

arr = [0, 1, 5, 4]
p bad_two_sum?(arr, 6) # => should be true
p bad_two_sum?(arr, 10) # => should be false

# O(n log n)
def great_search(arr, target)
  
  arr.each_with_index do |el, idx|
    return true if arr[idx + 1..-1].bsearch {|el2| el + el2 == target }
  end
  
  false 
end 

p great_search([1, 0, 4, 5], 6)
p great_search([1, 0, 4, 5], 10)