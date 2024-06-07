def factorial(n):
    if n <= 1:
        return 1
    return len(str(n * factorial(n-1)).rstrip("0"))
