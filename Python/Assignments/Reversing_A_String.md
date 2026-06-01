## Assignment - Reversing a String - 01-06-2026 ##


```python
# 1. Using Slicing (Most Common)
S = "LAHARI"

reversed_string = S[::-1]

print(reversed_string)

#[start : stop : step] --> [::-1]
```

    IRAHAL



```python
# 2. Using a For loop
S = "LAHARI"

result = ""

for letter in S:
    result = letter + result

print(result)

#  ->L->AL->HAL->AHAL->RAHAL->IRAHAL
```

    IRAHAL



```python
# 3. Using a For Loop with Range()
S = "LAHARI"

for i in range(len(S)-1, -1, -1):
    print(S[i], end="")

# range(5, -1, -1), L[0] A[1] H[2] A[3] R[4] I[5]
# Loop runs 5 → 4 → 3 → 2 → 1 → 0
```

    IRAHAL


```python
# 4. Using a While loop
S = "LAHARI"

index = len(S) - 1

while index >= 0:
    print(S[index], end="")
    index -= 1
```

    IRAHAL


```python
# 5. Using reversed() Function
S = "LAHARI"

reversed_string = "".join(reversed(S))

print(reversed_string)

#Built-in function. reversed(S) gives ['I', 'R', 'A', 'H', 'A', 'L']. then .join combines them into one string.
```

    IRAHAL



```python
# 6. Reverse and Store in a New Variable
S = "LAHARI"

reversed_string = ""

for i in range(len(S)-1, -1, -1):
    reversed_string += S[i]

print(reversed_string)
```

    IRAHAL



```python
# 7. Reverse Each Word in a Sentence
S = "This is Lahari"

words = S.split()

for word in words:
    print(word[::-1], end=" ")

# reverse each word individually, but keep the words in the same order.
# .split() converts string into a list ['This', 'is', 'Lahati'], then it loops through each word, to reverse each word individually. 
```

    sihT si irahaL 


```python
# 8. Reverse the Order of Words
S = "This is Lahari"

words = S.split()

reversed_words = words[::-1]

print(" ".join(reversed_words))

# This is NOT reversing characters. Only word positions are reversed.
# .split will give ['This', 'is', 'Lahari']. we reverse the list ['Lahari', 'is', 'This'].
# Then join the reversed list to Lahari is This.
```

    Lahari is This



```python
# 9. Reverse Both Words and Characters
S = "This is Lahari"

words = S.split()

reversed_words = words[::-1]

result = ""

for word in reversed_words:
    result += word[::-1] + " "

print(result)
# Word order reversed and Characters inside each word reversed 
# .split converts into list ['This', 'is', 'Lahari']. then we will reverse the word positions. ['Lahari', 'is', 'This'].
# Then we loop through the reversed list and reverse each word through iterations.
```

    irahaL si sihT 



```python
# 10. Reverse only the first 3 letters. 
S = "Lahari"

result = S[:3][::-1] + S[3:]

print(result)

# S[:3] gives Lah, we reverse it -> haL, and then attach the remaining ari --> ahLari
```

    haLari



```python
# Reverse Only Alphabets

S = "Lahari0809Jagarlamudi"

letters = ""

for l in S:
    if l.isalpha():
        letters = l + letters

print(letters)
# numbers will be ignored.
```

    idumalragaJirahaL

