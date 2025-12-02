from collections import Counter
import math

def min_attendees(answers):
    freq = Counter(answers)
    total = 0
    
    for k, count in freq.items():
        group_size = k + 1
        groups = math.ceil(count / group_size)
        total += groups * group_size
    
    return total

"""
import math

def min_attendees(answers):
    # Build frequency dictionary manually
    freq = {}
    for a in answers:
        if a in freq:
            freq[a] += 1
        else:
            freq[a] = 1

    total = 0
    for k, count in freq.items():
        group_size = k + 1
        groups = math.ceil(count / group_size)
        total += groups * group_size

    return total
"""

"""
# naive first attempt 3/5 pass
# question is related to pigeonhole principle
# doesn't work because the same answer can be given by different people
def min_attendees(answers):
	unique_values = set(answers)
	count = 0
	for i in unique_values:
	  count += (i+1)
	return count
"""
