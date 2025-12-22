def climb_hill(n):
    # Base cases
    if n == 0 or n == 1:
        return 1
    
    # Recursive case: ways to climb n steps =
    # ways to climb (n-1) + ways to climb (n-2)
    return climb_hill(n - 1) + climb_hill(n - 2)

"""
def climb_hill(n):
    if n == 0 or n == 1:
        return 1
    
    a, b = 1, 1  # ways to climb 0 and 1 steps
    for _ in range(2, n + 1):
        a, b = b, a + b
    return b
"""

"""
from functools import lru_cache

@lru_cache(maxsize=None)
def climb_hill(n):
    if n == 0 or n == 1:
        return 1
    return climb_hill(n - 1) + climb_hill(n - 2)
"""

"""
# only passes 3/4
def climb_hill(n):
	# Euler's partition function using pentagonal number theorem
    partitions = [1]  # p(0) = 1
    
    for i in range(1, n+1):
        total = 0
        k = 1
        while True:
            # Generalized pentagonal numbers
            pent1 = k * (3*k - 1) // 2
            pent2 = k * (3*k + 1) // 2
            
            if pent1 > i and pent2 > i:
                break
            
            sign = -1 if k % 2 == 0 else 1
            
            if pent1 <= i:
                total += sign * partitions[i - pent1]
            if pent2 <= i:
                total += sign * partitions[i - pent2]
            
            k += 1
        
        partitions.append(total)
    
    return partitions[n]
"""
