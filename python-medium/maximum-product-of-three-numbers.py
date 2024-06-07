def max_three(input):
    input.sort()
    n = len(input)
    return max(input[0] * input[1] * input[n-1], input[n-3] * input[n-2] * input[n-1])

'''
# doesn't work because of the negative numbers

def max_three(input):
    sorted_arr = sorted(input, reverse=True)
    nums = sorted_arr[:3]
    total_sum = 1
    for n in nums:
        total_sum *= n
    return total_sum
'''
