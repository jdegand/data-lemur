def longest_consecutive(nums):
    arr = sorted(nums)
    longest = 1
    current = 1
    
    for i in range(1, len(arr)):
        if arr[i] == arr[i-1] + 1:
            current += 1
            longest = max(longest, current)
        else:
            current = 1
    return longest
