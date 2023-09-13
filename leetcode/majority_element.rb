# Time optimized solution
def majority_elements(vals)
  count = Hash.new
  max_element = nil
  max_count = 0

  vals.each do |i|
    # Update the count
    if count.key? i
      count[i] += 1
    else
      count[i] = 1
    end

    # Update max values
    if max_count < count[i]
      max_count = count[i]
      max_element = i
    end
  end

  return max_element
end
