def intersection(a, b):
    return list(set(a) & set(b))

'''
def intersection(a, b):
    arr = get_longest_array(a, b)
    print(arr)
    
    for i in range(len(arr)):
        if i < len(a) and i < len(b) and a[i] == b[i]:
            print(f"Values at index {i} are equal: {a[i]}")
        else:
            if i < len(a) and i < len(b):
                print(f"Values at index {i} are different: {a[i]} and {b[i]}")
            elif i < len(a):
                print(f"Values at index {i} are different: {a[i]}")
            else:
                print(f"Values at index {i} are different: {b[i]}")

def get_longest_array(arr1, arr2):
    if len(arr1) > len(arr2):
        return arr1
    else:
        return arr2
'''
