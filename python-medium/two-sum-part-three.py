def max_two_sum(nums, k):
  max_sum = -1
  
  for i in range(len(nums)-1):
    for j in range(i+1, len(nums)):
      if(nums[i] + nums[j] < k):
        max_sum = max(nums[i] + nums[j], max_sum)
    
  return max_sum

"""
import bisect

def max_two_sum(nums: list[int], k: int) -> int:
    nums.sort() # Test case 3 requires this
    max_sum = -1
    for i in range(len(nums)):
        target = k - nums[i]
        # bisect_left finds insertion point
        j = bisect.bisect_left(nums, target, i+1) - 1
        if j > i:
            max_sum = max(max_sum, nums[i] + nums[j])
    return max_sum
"""

"""
def max_two_sum(nums: list[int], k: int) -> int:
    nums.sort()
    left, right = 0, len(nums) - 1
    max_sum = -1
    
    while left < right:
        current_sum = nums[left] + nums[right]
        
        if current_sum < k:
            max_sum = max(max_sum, current_sum)
            left += 1
        else:
            right -= 1
    
    return max_sum
"""
