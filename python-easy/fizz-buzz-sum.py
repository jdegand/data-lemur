def fizz_buzz_sum(target):
    total = 0
    num = target
    
    while num > 0:
        num -= 1
        
        if num % 5 == 0 or num % 3 == 0:
            total += num
    
    return total
