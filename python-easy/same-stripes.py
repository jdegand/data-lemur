# not optimized as you don't need to retain the diagonals
# diagonals often rely on row+col or row-col.
def is_same_stripes(matrix):
    if not matrix or not matrix[0]:
        return True  # empty matrix counts as valid

    m, n = len(matrix), len(matrix[0])
    diagonals = []

    # Start diagonals from each row in the first column
    for row_start in range(m):
        r, c = row_start, 0
        diagonal = []
        while r < m and c < n:
            diagonal.append(matrix[r][c])
            r += 1
            c += 1
        diagonals.append(diagonal)

    # Start diagonals from each column in the first row (skip col=0 to avoid duplicate)
    for col_start in range(1, n):
        r, c = 0, col_start
        diagonal = []
        while r < m and c < n:
            diagonal.append(matrix[r][c])
            r += 1
            c += 1
        diagonals.append(diagonal)

    # Check if every diagonal has all identical values
    return all(len(set(diagonal)) <= 1 for diagonal in diagonals)

"""
def is_same_stripes(matrix):
    if not matrix or not matrix[0]:
        return True  # empty matrix counts as valid

    m, n = len(matrix), len(matrix[0])

    # Start diagonals from each row in the first column
    for row_start in range(m):
        r, c = row_start, 0
        first = matrix[r][c]
        while r < m and c < n:
            if matrix[r][c] != first:
                return False
            r += 1
            c += 1

    # Start diagonals from each column in the first row (skip col=0 to avoid duplicate)
    for col_start in range(1, n):
        r, c = 0, col_start
        first = matrix[r][c]
        while r < m and c < n:
            if matrix[r][c] != first:
                return False
            r += 1
            c += 1

    return True
"""
