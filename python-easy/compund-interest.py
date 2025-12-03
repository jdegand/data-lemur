def compound_interest(principal, rate, contribution, years):
    total = principal
    for _ in range(years):
        total += total * (rate / 100.0)
        total += contribution
        
    return round(total, 2)
