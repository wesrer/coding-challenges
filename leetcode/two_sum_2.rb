# Leetcode 169

# N^2 solution
def two_sum_2(numbers, target)
  numbers.each_with_index do |v1, i|
    # Since the solution mentions there is only one solution, ignore duplicates
    # Necessary optimization: If you do not ignore duplicates, there are test cases that take too long
    next if numbers[i - 1] == v1 && i > 0 # prevents out-of-bounds access problems

    # Loop through the rest of the arr to find the desired value
    subarr = numbers[(i + 1)..]
    subarr.each_with_index do |v2, j|
      # Ignore dups in this loop as well
      next if subarr[j - 1] == v2 && j > 0 # prevents out-of-bounds access problems
      # Numbers are pre-sorted
      break if target < v1 + v2
       
      # Since the results are one indexed, you always have to add one
      # For j, you also have to add the offset that the subarray started from
      # The first paren is the index adjustment, the second paren is the offset
      return [i + 1, (j + 1) + (i + 1)] if target == v1 + v2
    end
  end
end
