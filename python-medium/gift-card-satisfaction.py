def max_satisfaction(expectations, cards):
    sorted_expectations = sorted(expectations)
    sorted_cards = sorted(cards)
    
    pointer1 = 0
    pointer2 = 0
    common = []

    while pointer1 < len(sorted_expectations) and pointer2 < len(sorted_cards):
        if sorted_expectations[pointer1] <= sorted_cards[pointer2]:
            common.append(sorted_expectations[pointer1])
            pointer1 += 1
            pointer2 += 1
        else:
            # card too small, try next card
            pointer2 += 1

    return len(common)
