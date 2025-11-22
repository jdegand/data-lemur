def romanToInt(s):
    lookup = {
        'I': 1,
        'V': 5,
        'X': 10,
        'L': 50,
        'C': 100,
        'D': 500,
        'M': 1000
    }
    
    result = 0
    n = len(s)
    
    for i in range(n):
        if i < n - 1 and lookup[s[i]] < lookup[s[i+1]]:
            result -= lookup[s[i]]
        else:
            result += lookup[s[i]]
    
    return result
