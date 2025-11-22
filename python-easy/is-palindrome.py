def isPalindrome(phrase):
    cleaned = ""
    for ch in phrase:
        if ch.isalnum():
            cleaned += ch.lower()
    return cleaned == cleaned[::-1]