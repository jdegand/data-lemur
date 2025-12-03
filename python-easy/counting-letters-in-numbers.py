# not easy at all - complete lookup map could be made but it would be very tedious 
def total_letters(n):
    units = [0,3,3,5,4,4,3,5,5,4]         # 0–9
    teens = [3,6,6,8,8,7,7,9,8,8]         # 10–19
    tens  = [0,0,6,6,5,5,5,7,6,6]         # 0–90 step 10 (index by 0–9)
    HUNDRED = 7
    AND = 3
    THOUSAND = 8
    ONE = 3

    def length_of_number(x):
        if x == 1000:
            return ONE + THOUSAND  # 11
        if x >= 100:
            h = x // 100
            r = x % 100
            base = units[h] + HUNDRED
            if r == 0:
                return base
            else:
                return base + AND + length_of_sub_100(r)
        else:
            return length_of_sub_100(x)

    def length_of_sub_100(x):
        if x == 0:
            return 0
        if x < 10:
            return units[x]
        if x < 20:
            return teens[x - 10]
        t = x // 10
        u = x % 10
        return tens[t] + (units[u] if u > 0 else 0)

    total = 0
    for i in range(1, n + 1):
        total += length_of_number(i)
    return total

"""
def total_letters(n):
    units = [0,3,3,5,4,4,3,5,5,4]
    teens = [3,6,6,8,8,7,7,9,8,8]
    tens  = [0,0,6,6,5,5,5,7,6,6]

    def sub_100(x):
        return (0 if x==0 else units[x] if x<10 else teens[x-10] if x<20 else tens[x//10]+(units[x%10] if x%10 else 0))

    def length(x):
        return 11 if x==1000 else (units[x//100]+7+(3+sub_100(x%100) if x%100 else 0) if x>=100 else sub_100(x))

    return sum(length(i) for i in range(1, n+1))
"""
