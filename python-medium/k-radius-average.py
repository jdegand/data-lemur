def k_radius_avg(nums, k):
	res = [-1] * len(nums)
	
	left = 0
	window_sum = 0
	diameter = 2 * k + 1
	
	for right in range(len(nums)):
	  window_sum += nums[right]
	  
	  if right - left + 1 == diameter:
	    res[left + k] = round(window_sum / diameter,2)
	    window_sum -= nums[left]
	    left += 1
	
	return res

"""
def k_radius_avg(nums, k):
    n = len(nums)
    res = [-1] * n
    diameter = 2 * k + 1
    
    if diameter > n:
        return res  # no valid averages
    
    window_sum = sum(nums[:diameter])  # initialize first window
    
    # place first average
    res[k] = round(window_sum / diameter, 2)
    
    # slide the window
    for i in range(diameter, n):
        window_sum += nums[i] - nums[i - diameter]
        res[i - k] = round(window_sum / diameter, 2)
    
    return res
"""

"""
def k_radius_avg_prefix(nums, k):
    n = len(nums)
    res = [-1] * n
    diameter = 2 * k + 1
    
    if diameter > n:
        return res  # no valid averages
    
    # build prefix sums
    prefix = [0] * n
    prefix[0] = nums[0]
    for i in range(1, n):
        prefix[i] = prefix[i - 1] + nums[i]
    
    # compute averages
    for i in range(n):
        left, right = i - k, i + k
        if left < 0 or right >= n:
            continue
        window_sum = prefix[right] - (prefix[left - 1] if left > 0 else 0)
        res[i] = round(window_sum / diameter, 2)
    
    return res
"""
