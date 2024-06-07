def two_sum(input: list[int], target: int) -> list[int]:
    map_of_numbers = {}
    two_indexes = []

    for i in range(len(input)):
        map_of_numbers[input[i]] = i

    for i in range(len(input)):
        goal = target - input[i]
        if goal in map_of_numbers and map_of_numbers[goal] != i:
            two_indexes.append(i)
            two_indexes.append(map_of_numbers[goal])
            return two_indexes

    if not two_indexes:
      return [-1,-1]
    return two_indexes
