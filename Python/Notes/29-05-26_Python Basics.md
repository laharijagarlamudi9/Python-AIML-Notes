# **29-05-2026 PYTHON BASICS**

Python is a high-level, interpreted programming language that is easy to read and write. Python focuses on readability, simplicity, and productivity.

Python is used in Web Development, Data Science, AI/ML, Automation, Cloud & DevOps, Cyber Security.


#### Print: The print() function is used to display output on the screen. ####


```python
print("Hello Lahari")
```

    Hello Lahari



```python
print(17 + 9)
```

    26


### Fundamental Types ###

#### Integers ####
Integers are whole numbers without decimals.


```python
a = 5
b = 10
print(a+b)
```

    15


#### Variables ####
A variable is a container used to store data. Think of it as a labeled box. Variables do not store data directly; instead, they act as references (pointers) to objects that exist in memory


```python
age = 25
print("Age is: " + str(age))
```

    Age is: 25


Variable Reassignment : A variable value can be changed anytime. 


```python
City = "Edison"
print(City)

City = "Piscataway"
print(City)
```

    Edison
    Piscataway


#### Float ####
A float represents decimal numbers : 10.5, 25.99, 100.75


```python
x = 5 # --> int
y = 10.2 # --> float
z = x + y # int + float = float
print(z)
type(z)
```

    15.2





    float



#### Boolean Basics ####
Boolean represents only two values : True, False. Used for decision makling


```python
is_logged_in = True
print(is_logged_in)
print(type(True))
```

    True
    <class 'bool'>


#### Strings ####
A string is a collection of characters enclosed in quotes. "Python", "Lahari"


```python
first_name = "Govinda Lahari"
last_name = "Jagarlamudi"

print(first_name + " " + last_name)
```

    Govinda Lahari Jagarlamudi


#### Type Conversion ####
Data conversion in Python, also known as type conversion or type casting, is the process of changing a value from one data type to another. Python categorizes this into two main types: 

--> Implicit : Implicit conversion occurs automatically when the Python interpreter converts one data type to another without user       intervention. This usually happens to avoid data loss by promoting a "lower" data type to a "higher" one. 
Example:  Adding an int to a float. Python automatically converts the integer to a float so the result is a float (e.g., 5 + 2.0 becomes 7.0).

--> Explicit : Explicit conversion is performed manually by the programmer using built-in functions. This gives you control over how data is processed, which is necessary when Python cannot automatically determine how to handle incompatible types (like adding a string "10" to an integer 5)

#### Dynamic vs Duck Typing ####
--> Dynamic typing means you don't have to tell Python what kind of data a variable will hold (like an integer or a string) when you create it. Python figures it out automatically at runtime (while the program is running) based on the value you assign to it. You can assign a number to a variable and later assign a piece of text to that same variable name without any errors.

--> Duck typing is a concept often summarized by the phrase: "If it walks like a duck and quacks like a duck, then it must be a duck". In Python, the language doesn't care what an object is (its class or type); it only cares what the object can do (its methods and behaviors). If you have a function that expects an object to have a .quack() method, Python will let you pass any object into that function as long as it has a .quack() method—whether it's a Duck class, a Person class, or a Robot class.

#### Complex Numbers ####
Used in scientific and mathematical calculations. Format: real + imaginary j


```python
x = 3 + 4j
print(x)
print(x.real)
print(x.imag)
type(x)
```

    (3+4j)
    3.0
    4.0





    complex



### Operators in Python ###


```python
a = 9
b = 3

print(a + b)   # Addition
print(a - b)   # Subtraction
print(a * b)   # Multiplication
print(a / b)   # Division
print(a // b)  # Floor Division
print(a % b)   # Modulus
print(a ** b)  # Power
```

    12
    6
    27
    3.0
    3
    0
    729


### Comparision Operations ###
Used to compare values. Result is always True or False.


```python
a = 10
b = 20

print(a == b)   # Equal
print(a != b)   # Not Equal
print(a > b)    # Greater than
print(a < b)    # Less than
print(a >= b)   # Greater than or equal
print(a <= b)   # Less than or equal
```

    False
    True
    False
    True
    False
    True


### Logical Operations ###
Used to combine conditions.


```python
# AND - Both conditions must be True.
age = 25
print(age > 18 and age < 60)
```

    True



```python
# OR - At least one condition must be True.
age = 70

print(age < 18 or age > 60)
```

    True



```python
# NOT - Reverses result.
is_logged_in = True

print(not is_logged_in)
```

    False


### Assignment Operators ###
Used to update values quickly.


```python
x = 10   # --> Basic Assignment
# x += 5 # --> x = x + 5 Addition Assignment
# x -= 3 # --> x = x - 3 Subtraction Assignment
# x *= 2 # --> x = x * 2 Multiplication Assignment
# x /= 5 # --> x = x / 5 Division Assignment
# x %= 3 # --> x = x % 3 Modulus Assignment
# x **= 2 # --> x = x ^ 2 Power Assignment
```

### Input Function ###
The input() function is used to take input from the user while the program is running.
Basic Syntax : input("Message to user")


```python
name = input("Enter your name: ")

print(name)
```

    Enter your name:  Lahari


    Lahari


#### NOTE #### 
Default Data Type of input(): Whatever the user enters, Python stores it as a STRING by default.
Even numbers become strings.


```python
age = input("Enter your age: ")

print(age)
print(type(age))

# Even though you entered 25, Python treats it as a string.
```

    Enter your age:  25


    25
    <class 'str'>



```python
x = input("Enter first number: ")
y = input("Enter second number: ")

print(x + y)

# Since input() function treats input as string by default,  Python joins strings instead of adding numbers.
```

    Enter first number:  10
    Enter second number:  3


    103


#### Defining a Data Type ####


```python
# x = data_type(input(" ")) 

age = int(input("Enter your age: "))

print(age)
print(type(age))
```

    Enter your age:  25


    25
    <class 'int'>


### F-String and .format ###
They are used to display variables inside text. f-string means Formatted string literal. Before f-string existed, .format() was commonly used.


```python
# String Concatination in general

name = "Lahari"
salary = 90000

print("Hello " + name + ", your salary is " + str(salary))
```

    Hello Lahari, your salary is 90000



```python
# using f-string
name = "Lahari"
salary = 90000

print(f"Hello {name}, you salary is {salary}")
```

    Hello Lahari, you salary is 90000



```python
# using .format
name = "Lahari"
salary = 90000

print("Hello {}, your salary is {}".format(name, salary))
```

    Hello Lahari, your salary is 90000


### Boolean Evaluation Operations ### 
Python checks an expression and determines whether it is True or False.


```python
print(10 > 5)
print(10 < 5)
```

    True
    False


### Branching ###
Making decisions in a program based on conditions.

Just like in real life:
If it rains → take an umbrella, Else → wear sunglasses

this structure looks like if->elif->else


```python
marks = 82

if marks >= 90:
    print("Grade A")

elif marks >= 75:
    print("Grade B")

elif marks >= 60:
    print("Grade C")

else:
    print("Fail")

```

    Grade B



```python
# Python stops checking after the first True condition. It is important to write the conditions and statements in order. if not,
# it will give wrong results. 

marks = 95

if marks >= 60:
    print("Grade C")

elif marks >= 75:
    print("Grade B")

elif marks >= 90:
    print("Grade A")

# Wrong result because Python stops at the first True condition.
```

    Grade C


#### Nested If Statement ####
An if statement inside another if statement.


```python
age = 25
has_license = True

if age >= 18:

    if has_license:
        print("Can Drive")

    else:
        print("License Required")

else:
    print("Too Young")
```

    Can Drive



```python

```


```python

```


```python

```


```python

```
