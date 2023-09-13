# Easy solution
def missing_num(nums)
  return ((0..nums.size).to_a - nums)[0]
end
