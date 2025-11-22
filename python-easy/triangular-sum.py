def triangular_sum(nums):
    n = len(nums)
    for size in range(n, 1, -1):
        for i in range(size - 1):
            nums[i] = (nums[i] + nums[i+1]) % 10
    return nums[0]

"""
def triangular_sum(nums):
    while len(nums) > 1:
        newNums = []
        for i in range(len(nums) - 1):
            newNums.append((nums[i] + nums[i+1]) % 10)
        nums = newNums
    return nums[0]
"""
