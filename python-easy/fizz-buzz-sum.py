def fizz_buzz_sum(target):
    sum = 0
    num = target
    
    while num > 0:
        num -= 1
        
        if num % 5 == 0 or num % 3 == 0:
            sum += num
    
    return sum
