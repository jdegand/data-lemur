# explanation of the problem isn't great
def gpu_idle_days(days, training_sessions):
    training_sessions.sort()  # Sort sessions by start time
    merged_sessions = []
    start, end = training_sessions[0]
    
    for s, e in training_sessions:
        if start <= s <= end:  # Overlap detected
            end = max(end, e)  # Extend the interval
        else:
            merged_sessions.append([start, end])
            start, end = s, e
    
    # Don’t forget to add the last merged interval
    merged_sessions.append([start, end])
    
    total_used_days = 0
    for start, end in merged_sessions:
    	# Add the number of days the GPUs are in use
        total_used_days += (end - start + 1)  
    return days - total_used_days

"""
def gpu_idle_days(days, training_sessions):
    if not training_sessions:
        return days
    
    # Sort sessions by start time
    training_sessions.sort()
    
    total_used_days = 0
    start, end = training_sessions[0]
    
    for s, e in training_sessions[1:]:
        if s <= end:  # Overlap or contiguous
            end = max(end, e)
        else:
            total_used_days += end - start + 1
            start, end = s, e
    
    # Add the last interval
    total_used_days += end - start + 1
    
    return days - total_used_days
"""
