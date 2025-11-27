def min_amplitude(arr):
    arr.sort()
    n = len(arr)
    if n <= 3:
        return 0  # can change all elements
    
    return min(
        arr[n-1] - arr[3],   # remove 3 smallest
        arr[n-2] - arr[2],   # remove 2 smallest + 1 largest
        arr[n-3] - arr[1],   # remove 1 smallest + 2 largest
        arr[n-4] - arr[0]    # remove 3 largest
    )
