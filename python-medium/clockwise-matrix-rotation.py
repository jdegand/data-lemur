def rotate(matrix):
    n = len(matrix)
    ans = [[0] * n for _ in range(n)]
    
    for i in range(n):
        for j in range(n):
            ans[j][n - 1 - i] = matrix[i][j]
  
    return ans
