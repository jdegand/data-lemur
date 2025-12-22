def can_insert_ads(feed_items, n):
    count = 0

    # Check first slot
    if feed_items[0] not in (1, 2):
        count += 1

    # Check middle slots
    for i in range(1, len(feed_items) - 1):
        if feed_items[i] not in (1, 2) and feed_items[i+1] not in (1, 2):
            count += 1

    # Check last slot
    if feed_items[-1] not in (1, 2):
        count += 1

    return count == n

"""
# The logic breaks down specifically when the input contains runs of consecutive zeros.
def can_insert_ads(feed_items, n):
    count = 0

    # Check first slot
    if feed_items[0] not in (1, 2):
        count += 1

    # Check middle slots
    for i in range(1, len(feed_items) - 1):
        if feed_items[i] not in (1, 2) and feed_items[i-1] not in (1, 2) and feed_items[i+1] not in (1, 2):
            count += 1

    # Check last slot
    if feed_items[-1] not in (1, 2):
        count += 1

    return count == n
"""

"""
# 5/6 still fails same test case
def can_insert_ads(feed_items, n):
    count = 0
    i = 0

    while i < len(feed_items):
        if feed_items[i] == 0:
            # start of a run of zeros
            run_length = 0
            while i < len(feed_items) and feed_items[i] == 0:
                run_length += 1
                i += 1
            # how many ads can fit in this run
            count += (run_length + 1) // 2
        else:
            i += 1

    return count == n
"""
