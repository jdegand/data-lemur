def generate(numRows):
    triangle = []
    for _ in range(numRows):
        if not triangle:
            triangle.append([1])
        else:
            prev = triangle[-1]
            # Build the next row using zip to add adjacent pairs
            row = [1] + [a + b for a, b in zip(prev, prev[1:])] + [1]
            triangle.append(row)
    return triangle
