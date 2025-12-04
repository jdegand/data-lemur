import numpy as np

def can_be_rotated(mat, target):
    arr = np.array(mat)
    tgt = np.array(target)
    
    # Try all 4 rotations (0°, 90°, 180°, 270°)
    for k in range(4):
        if np.array_equal(arr, tgt):
            return True
        arr = np.rot90(arr, k=1)  # rotate 90 degrees clockwise
    return False
