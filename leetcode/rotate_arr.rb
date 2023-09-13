# Given an integer arr nums, rotate it right by k times
# Input - nums = [1,2,3,4,5,6,7], k = 3
# Output - [5,6,7,1,2,3,4]
# rotate 1 steps to the right: [7,1,2,3,4,5,6]
# rotate 2 steps to the right: [6,7,1,2,3,4,5]
# rotate 3 steps to the right: [5,6,7,1,2,3,4]

# Space Complexity - O(n + k)
def rotate(nums, k)
  len = nums.size
  
  # These are going to be at the beginning of the return arr
  t = nums[(len - k)..(len - 1)]
  
  # Now fill the rest of the array
  (len - 1).downto(k) do |i|
    # shift
    t[i] = nums[i - k]  
  end
  # This algo technically uses n^2 space, but instead of filling it in t, 
  # you can just shift in place and then replace the first few elements of nums
  # with elements from t which would be n + k
end

# Space Complexity - O(1)
# Basic idea, you replace space complexity with time
# instead of storing k elements, you store 1 element and do the computation k times
# Horribly bad solution, but an option
def rotate(nums, k)
  k.times do |_|
    t = nums[-1]

    (len - 1).downto(1) do |i| 
      nums[i] = nums[i - 1]
    end
    
    nums[0] = t
  end
end
