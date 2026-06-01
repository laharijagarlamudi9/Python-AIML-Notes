## 01-06-2026 LOOPS, String Basic Built-in Functions ##
##### A loop is a programming structure that allows us to execute a block of code multiple times without writing the same code repeatedly. #####
##### A loop is a control structure that repeatedly executes a block of code until a specified condition becomes false or until all items in a sequence are processed. ##### 

### FOR LOOP ### 
##### A for loop is used to repeat a block of code for every item in a sequence. #####
##### The sequence can be: Numbers (range()), String characters, Lists, Tuples, Dictionaries, Sets #####
##### A for loop is generally used when we know how many times we want the loop to run or when we want to process every item in a collection. #####


```python
# Variable to store the running total
total = 0

# Loop from 1 to 10
for num in range(1, 11):

    # Add current number to total
    total = total + num

# Display final result
print("Sum of numbers from 1 to 10 is:", total)
```

    Sum of numbers from 1 to 10 is: 55



```python
for i in range(1, 6):
    print("Current value of i is:", i)
# this shows what is the value of i in each iteration 
```

    Current value of i is: 1
    Current value of i is: 2
    Current value of i is: 3
    Current value of i is: 4
    Current value of i is: 5



```python
n = int(input("Enter a number: "))

total = 0

for num in range(1, n + 1):
    total = total + num

print("Sum =", total)
```

    Enter a number:  9


    Sum = 45


#### Reversing a String ####


```python
# Original string
text = "Lahari"

# Empty string to store reversed result
reversed_text = ""

# Loop through each character
for letter in text:

    # Add current character to the beginning
    reversed_text = letter + reversed_text

# Display result
print("Original String :", text)
print("Reversed String :", reversed_text)
```

    Original String : Lahari
    Reversed String : irahaL


#### WHILE LOOP ####

##### A while loop is used to repeatedly execute a block of code as long as a condition remains True. #####
##### Unlike a for loop, where we usually know the number of iterations beforehand, a while loop is used when we do not know exactly how many times the loop should run. #####

##### Imagine you are filling a water tank. #####
##### While tank is NOT full:Keep filling water #####
##### Once the tank becomes full:Stop filling water #####
##### This is exactly how a while loop works. #####



```python
# Starting value
count = 1

# Loop runs while count is less than or equal to 5
while count <= 5:

    print(count)

    # Increase count by 1
    count += 1
```

    1
    2
    3
    4
    5



```python
# count down

count = 10

while count >= 1:

    print(count)

    count -= 1
```

    10
    9
    8
    7
    6
    5
    4
    3
    2
    1



```python
# user controlled loop 

answer = ""

while answer != "yes":

    answer = input("Do you want to exit? Type yes: ")

print("Program Ended")
```

    Do you want to exit? Type yes:  no
    Do you want to exit? Type yes:  yay
    Do you want to exit? Type yes:  yes


    Program Ended


#### Infinite Loop ####


```python
# An infinite loop never ends.

#while True:
#    print("Running...")
# if we exceute this, it keeps printing 'Running..." forever.
```

#### RANGE FUNCTION ####
##### The range() function is used to generate a sequence of numbers. #####
##### It is most commonly used with for loops to control how many times the loop should run. #####


```python
for i in range(5):
    print(i)
# range(x), here x will not be printed in the result. it will print until x-1
```

    0
    1
    2
    3
    4



```python
# range(start, stop)
for i in range(1, 6):
    print(i)
```

    1
    2
    3
    4
    5



```python
# range(start, stop, step), Move by step
for i in range(1, 11, 2):
    print(i)
# Start at 1, Add 2 each time, Stop before 11
```

    1
    3
    5
    7
    9



```python
# We can also count backwards.

for num in range(10, 0, -1):
    print(num)
#Subtract 1 each time
```

    10
    9
    8
    7
    6
    5
    4
    3
    2
    1


#### BREAK AND CONTINUE ####
##### Both break and continue are loop control statements. They help us change the normal behavior of a loop. #####

##### BREAK: The break statement is used to immediately stop a loop. As soon as Python encounters break, the loop terminates and control moves to the next statement after the loop. #####


```python
# stop at num 5

for num in range(1, 11):

    if num == 5:
        break

    print(num)
```

    1
    2
    3
    4



```python
# User login attempt

while True:

    password = input("Enter password: ")

    if password == "python123":
        print("Login Successful")
        break

    print("Wrong Password")
```

    Enter password:  I Dont' Know


    Wrong Password


    Enter password:  python123


    Login Successful



```python
# Search a number
num = 1

while num <= 10:

    if num == 6:
        print("Number Found")
        break

    print(num, "-> Not Found")

    num += 1
```

    1 -> Not Found
    2 -> Not Found
    3 -> Not Found
    4 -> Not Found
    5 -> Not Found
    Number Found


##### CONTINUE: The continue statement skips the current iteration and moves directly to the next iteration of the loop. Unlike break, it does not stop the loop completely. #####


```python
# Skip a number (5)
for num in range(1, 11):

    if num == 5:
        continue

    print(num)
```

    1
    2
    3
    4
    6
    7
    8
    9
    10



```python
# Print only odd numbers

for num in range(1, 11):

    if num % 2 == 0:
        continue

    print(num)
```

    1
    3
    5
    7
    9



```python
# Example Showing Both Break and Continue
for num in range(1, 11):

    # Skip 5
    if num == 5:
        continue

    # Stop at 8
    if num == 8:
        break

    print(num)
```

    1
    2
    3
    4
    6
    7



```python
# Online Shopping Checkout (break + continue Together)
while True:

    coupon = input("Enter Coupon Code: ")

    # Empty input
    if coupon == "":
        print("Coupon cannot be empty")
        continue

    # Valid coupon
    if coupon == "LAHARI20":
        print("20% Discount Applied")
        break

    print("Invalid Coupon")
```

    Enter Coupon Code:  Lahari


    Invalid Coupon


    Enter Coupon Code:  LAHARI20


    20% Discount Applied


### CONTAINERS IN PYTHON : STRINGS ### 

##### STRING : A String is a sequence of characters enclosed within:' ', " ", ''' ''' #####
##### A string can contain: Letters, Numbers, Symbols, Spaces #####


```python
username = "lahari"
email = "lahari@gmail.com"
```

#### Printing a String ####


```python
# 1. Pass the literal text directly into the function:
print("Hey!, This is Lahari")
```

    Hey!, This is Lahari



```python
# 2. Store your text in a variable, then pass the variable name into the function:
age = 25
print("I am", age, "years young")
```

    I am 25 years young



```python
# 3. only in jupyter, we can just type the text and print it.
"Testing types pf printing"
```




    'Testing types pf printing'



### New Line Character (\n) ### 
##### \n means move to the next line. #####


```python
print("Hello\nWorld")
```

    Hello
    World



```python
print("Name: Lahari\nAge: 25\nLocation: New Jersey")
```

    Name: Lahari
    Age: 25
    Location: New Jersey


### Len() function ### 
##### Used to find the total number of characters. #####
##### It does not manually iterate over your collection to count items one by one. Instead, built-in containers like lists, strings, and dictionaries have an internal memory attribute that stores their current size dynamically. #####


```python
text = "This is Lahari"

print(len(text))
```

    14


### String Indexing ###
##### allows you to access individual items in a sequence—such as a list, string, or tuple—by using their exact position number inside square brackets []. Python uses zero-based indexing, meaning the very first element of a collection is always at position 0. #####

##### Positive Indexing: Counts from the left side, starting at 0 for the first element. Negative Indexing: Counts from the right side, starting at -1 for the last element. #####


```python
name = "LAHARI"

print(len(name))
print(name[0])   
# print(name[6]) -> this will give error, though the len of name = 6, index will not be till 6. L[0], A[1], H[2], A[3], R[4], I[5]
print(name[5])
print(name[-1]) 
```

    6
    L
    I
    I



```python
# Indexing a list
fruits = ["apple", "banana", "cherry"]
print(fruits[1])   # Output: 'banana'

# Modifying a mutable item (Lists only)
fruits[2] = "date" 
print(fruits)      # Output: ["apple", "banana", "date"]
```

    banana
    ['apple', 'banana', 'date']


### String Slicing ###
##### Used to extract multiple characters. #####
##### If you need to extract a range or subset of elements instead of just one, you can use slicing syntax: sequence[start:end:step]. ##### 
##### start: The index where the slice begins (inclusive). end: The index where the slice stops (exclusive). step: Optional increment value between elements. #####


```python
numbers = [0, 9, 17, 19, 10, 25]

# Extract from index 1 up to (but excluding) 4
print(numbers[1:4])   

# Step through the list by 2
print(numbers[::2])   

# Reverse a list using a negative step
print(numbers[::-1]) 
```

    [9, 17, 19]
    [0, 17, 10]
    [25, 10, 19, 17, 9, 0]


### String Multiplication ### 
##### Repeat a string multiple times. #####


```python
print("WOW " * 3)
```

    WOW WOW WOW 


### upper() ###
##### Converts all characters to uppercase. #####


```python
name = "lahari"

print(name.upper())
```

    LAHARI


### lower() ### 
Converts all characters to lowercase.


```python
name = "LaHaRi"

print(name.lower())
```

    lahari


### Split() ###
##### Breaks a string into pieces. If no arguments are provided, the method splits on any whitespace character (spaces, tabs, newlines) and automatically groups consecutive spaces. #####

##### Pass a specific character or string to divide data formatted with delimiters like commas or hyphens. #####


```python
s = "Hello World"
print(s.split()) 

```

    ['Hello', 'World']



```python
Name = "Lahari"
print(Name.split("r"))
# splitting on a specific character. While splitting so, it will skip that specific character and print the remaining characters.
```

    ['Laha', 'i']



```python
names = "Govinda,Lahari,Jagarlamudi"
print(names.split(","))
```

    ['Govinda', 'Lahari', 'Jagarlamudi']


### Count() ###
##### Counts occurrences. #####


```python
text = "banana"
print(text.count("a"))
```

    3


### find() ###
##### Finds the position of a substring. #####


```python
text = "PYTHON"
print(text.find("T"))
```

    2



```python
# what happens if the character is not found in then string.
text = "PYTHON"
print(text.find("Z"))
```

    -1


### expandstab() ###
##### Converts tab spaces into actual spaces. #####


```python
text = "Name\tAge\tCity"

print(text.expandtabs())
```

    Name    Age     City


### IS CHECK METHODS ###

### isalnum() ###

#####  method returns True if all characters in a string are alphanumeric (letters or numbers) and the string contains at least one character. If the string contains any spaces, symbols, punctuation, or is completely empty, it returns False. #####


```python
print("Python123".isalnum())
```

    True



```python
# Space is not allowed.
print("Python 123".isalnum())
```

    False


### isalpha() ###
#####  string method returns True if all characters in a string are alphabetic letters and the string contains at least one character. If the string contains any spaces, numbers, symbols, or is completely empty, it returns False. #####


```python
print("Python".isalpha())
```

    True


### islower() ### 
##### if all cased characters (letters) in a string are lowercase, and there is at least one cased character present. Otherwise, it returns False ##### 


```python
print("python".islower())
print("Lahari".islower())
```

    True
    False


### isupper() ###
method returns True if all cased characters in a string are uppercase, and there is at least one cased character present. Otherwise, it returns False.


```python
print("PYTHON".isupper())
```

    True


### isspace() ### 
##### True if a string contains only whitespace characters and is at least one character long. It returns False if the string contains any letters, numbers, punctuation, or if the string is empty. #####


```python
print("   ".isspace())
```

    True


### istitle() ###
#####  returns True if a string follows title case rules, meaning every word must begin with an uppercase letter followed exclusively by lowercase letters. It returns False if any uppercase letter follows another uppercase letter, if a word begins with a lowercase letter, or if the string is empty. #####


```python
print("Python Programming".istitle())
print("python Programming".istitle())   # False (lowercase 'p')
print("HTML Tutorial".istitle())        # False (consecutive uppercase)
print("Abc123p".istitle())              # False (p is lowercase after numbers)
print("10 Welcome Users".istitle())     # True (numbers are ignored)
print("A-B-C".istitle())                # True (letters follow symbols, all uppercase)
```

    True
    False
    False
    False
    True
    True


### endswith() ###
##### method returns True if a string ends with a specified suffix; otherwise, it returns False. It is a built-in string method commonly used for text processing, URL validation, and filtering file extensions. #####


```python
file = "notes.pdf"

print(file.endswith(".pdf"))
```

    True


### partition() ###
##### Unlike split(), partition divides into exactly 3 parts. splits a string at the first occurrence of a specified separator and always returns a tuple containing exactly three elements. #####


```python
text = "Govinda-Lahari"

print(text.partition("-"))
```

    ('Govinda', '-', 'Lahari')

