def min_inequity(salaries, n):
    sorted_salaries = sorted(salaries)
    
    min_inequity_value = float('inf')
    for i in range(len(sorted_salaries) - n + 1):
        inequity = sorted_salaries[i + n - 1] - sorted_salaries[i]
        min_inequity_value = min(min_inequity_value, inequity)
    
    return min_inequity_value

'''
# doesn't work for all cases

def min_inequity(salaries, n):
	sorted_arr = sorted(salaries)
	shortened_arr = sorted_arr[:-n]
	return max(shortened_arr) - min(shortened_arr)
'''

'''
# doesn't work for all cases

def min_inequity(salaries, n):
    sorted_arr = sorted(salaries)
    shortened_arr = sorted_arr[:-n]
    max_value = max(salaries)
    lowest = float("inf")
    secondLowest = float("inf")

    for val in shortened_arr:
      if val < lowest:
        secondLowest = lowest
        lowest = val
      elif val < secondLowest:
        secondLowest = val
    
    return abs(lowest-secondLowest)
'''
