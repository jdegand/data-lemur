def most_popular(nums, n):
    # Step 1: build frequency dictionary
    freq = {}
    for num in nums:
        if num in freq:
            freq[num] += 1
        else:
            freq[num] = 1

    # Step 2: turn dictionary into a list of (number, count) pairs
    items = list(freq.items())

    # Step 3: sort by count (descending), then by number (ascending)
    items.sort(key=lambda pair: (-pair[1], pair[0]))

    # Step 4: take the first n items
    top_n = items[:n]

    # Step 5: collect just the numbers, sorted ascending
    result = [num for num, count in top_n]
    result.sort()

    return result
