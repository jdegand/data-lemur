def missing_int(input: list[int])-> int:
   n = len(input)
   total_sum = n * (n + 1)
   actual_sum = sum(input)
   return total_sum - actual_sum
