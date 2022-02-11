def two_sums(nums, target)
  hashmap = Hash.new

  nums.each_with_index do |val, i|
    complement = target - val
    complement_index = hashmap.fetch(complement, false)

    return [i, complement_index] if complement_index

    hashmap[val] = i
  end
end
