def isLoopingNumber(n):
    # helper function: sum of squares of digits
    def nextNumber(x):
        total = 0
        while x > 0:
            digit = x % 10
            total = total + digit * digit
            x = x // 10
        return total

    # initialize two pointers
    slow = n
    fast = nextNumber(n)

    while fast != 1 and slow != fast:
        slow = nextNumber(slow)             # move one step
        fast = nextNumber(nextNumber(fast)) # move two steps

    if fast == 1:
        return False   # reached 1 → not looping
    else:
        return True    # cycle detected → looping
