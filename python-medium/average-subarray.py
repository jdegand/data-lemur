def max_avg_subarray(nums, k):
    n = len(nums)
    if n < k:
        return 0  # or raise an error if k > n
    
    # Compute the sum of the first window
    window_sum = sum(nums[:k])
    max_sum = window_sum
    
    # Slide the window
    for i in range(k, n):
        window_sum += nums[i] - nums[i - k]
        max_sum = max(max_sum, window_sum)
    
    return round(max_sum / k,2)
