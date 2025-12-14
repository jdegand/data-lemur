def weakest_strong_link(strength):
    for i, row in enumerate(strength):
        min_val = min(row)
        j = row.index(min_val)
        col = [strength[r][j] for r in range(len(strength))]
        if min_val == max(col):
            return min_val
    return -1
