def convertToBase13(num: int) -> str:
    base13_digits = "0123456789ABC"
    
    if num == 0:
        return "0"
    
    negative = num < 0
    num = abs(num)
    
    digits = []
    while num:
        digits.append(base13_digits[num % 13])
        num //= 13
    
    result = ''.join(reversed(digits))
    return '-' + result if negative else result