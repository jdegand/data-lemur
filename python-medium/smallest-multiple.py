import math

def lcm(a, b):
    return abs(a*b) // math.gcd(a,b)

def smallest_multiple(target):
    arr = []
    for i in range(target, 0, -1):
      arr.append(i)
  
    result = arr[0]
    for i in range(1, len(arr)):
        result = lcm(result, arr[i])
    return result
