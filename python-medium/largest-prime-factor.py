import math

def largest_prime_factor(target):
    def is_prime(n):
        if n == 2:
            return True
        if n % 2 == 0:
            return False
        for i in range(3, int(math.sqrt(n)) + 1, 2):
            if n % i == 0:
                return False
        return True

    prime_factors = []
    for i in range(2, int(math.sqrt(target)) + 1):
        if target % i == 0 and is_prime(i):
            prime_factors.append(i)
            while target % i == 0:
                target //= i
    if target > 1:
        prime_factors.append(target)

    return max(prime_factors)
