def max_subarray_sum(input):
    max_sum = 0
    current_sum = 0

    for num in input:
        current_sum = max(num, current_sum + num)
        max_sum = max(max_sum, current_sum)

    return max_sum

'''
# don't need to check for negative values with kadane's algo

def check_all_negative(arr):
    for num in arr:
        if num >= 0:
            return False
    return True

def max_subarray_sum(input):
    if check_all_negative(input):
        return 0
    max_sum = 0
    current_sum = 0

    for num in input:
        current_sum = max(num, current_sum + num)
        max_sum = max(max_sum, current_sum)

    return max_sum
'''