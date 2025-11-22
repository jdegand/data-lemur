def is_anagram(a: str, b: str) -> bool:
    return sorted(a) == sorted(b)

"""
def is_anagram(a: str, b: str) -> bool:
    if len(a) != len(b):
        return False
    
    counts = [0] * 26
    
    for i in range(len(a)):
        counts[ord(a[i]) - ord('a')] += 1
        counts[ord(b[i]) - ord('a')] -= 1
    
    return all(c == 0 for c in counts)
"""

"""
from collections import Counter

def is_anagram(a: str, b: str) -> bool:
    if len(a) != len(b):
        return False
    return Counter(a) == Counter(b)
"""
