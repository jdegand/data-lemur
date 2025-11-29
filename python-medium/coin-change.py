def coin_change(coins, target_amount):
    memo = {}
    
    def dfs(rem):
        if rem == 0:
            return 0
        if rem < 0:
            return float('inf')
        if rem in memo:
            return memo[rem]
        
        ans = float('inf')
        for coin in coins:
            res = dfs(rem - coin)
            if res != float('inf'):
                ans = min(ans, res + 1)
        
        memo[rem] = ans
        return ans
    
    result = dfs(target_amount)
    return result if result != float('inf') else -1

"""
# this can only solve 4/5 test cases
def coin_change(coins, target_amount):
    # single coin
    if target_amount in coins:
        return 1

    # pairs
    for i in range(len(coins)):
        for j in range(len(coins)):
            if coins[i] + coins[j] == target_amount:
                return 2

    # triples
    for i in range(len(coins)):
        for j in range(len(coins)):
            for k in range(len(coins)):
                if coins[i] + coins[j] + coins[k] == target_amount:
                    return 3

    # divisible by a single coin (fallback)
    div_ans = min(
        (target_amount // c for c in coins if target_amount % c == 0),
        default=float('inf')
    )

    # greedy (descending) fallback
    remaining = target_amount
    count = 0
    for c in sorted(coins, reverse=True):
        take = remaining // c
        count += take
        remaining -= take * c
    greedy_ans = count if remaining == 0 else float('inf')

    ans = min(div_ans, greedy_ans)
    return ans if ans != float('inf') else -1
"""
