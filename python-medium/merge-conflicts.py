def has_merge_conflict(pull_requests) -> bool:
    for pr1 in pull_requests:
        for pr2 in pull_requests:
            if pr1 != pr2 and pr1[0] <= pr2[1] and pr1[1] >= pr2[0]:
                return True
    return False
