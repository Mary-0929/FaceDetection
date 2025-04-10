import math

# Function to perform addition
def add(x, y):
    return x + y

# Function to perform subtraction
def subtract(x, y):
    return x - y

# Function to perform multiplication
def multiply(x, y):
    return x * y

# Function to perform division
def divide(x, y):
    if y != 0:
        return x / y
    else:
        return "Error! Division by zero."

# Function to calculate square root
def square_root(x):
    if x >= 0:
        return math.sqrt(x)
    else:
        return "Error! Cannot calculate square root of a negative number."

# Function to calculate exponentiation
def exponentiate(x, y):
    return x ** y

# Function to perform trigonometric functions (sin, cos, tan)
def trigonometric_function(func, angle_in_degrees):
    # Convert angle from degrees to radians
    angle_in_radians = math.radians(angle_in_degrees)
    
    if func == 'sin':
        return math.sin(angle_in_radians)
    elif func == 'cos':
        return math.cos(angle_in_radians)
    elif func == 'tan':
        return math.tan(angle_in_radians)
    else:
        return "Error! Invalid trigonometric function."

# Main function to interact with the user
def calculator():
    print("Welcome to the Python Calculator!")

    while True:
        print("\nSelect operation:")
        print("1. Add")
        print("2. Subtract")
        print("3. Multiply")
        print("4. Divide")
        print("5. Square Root")
        print("6. Exponentiation")
        print("7. Trigonometric Functions (sin, cos, tan)")
        print("8. Exit")

        choice = input("Enter choice (1/2/3/4/5/6/7/8): ")

        # Perform operations based on user's choice
        if choice == '1':
            num1 = float(input("Enter first number: "))
            num2 = float(input("Enter second number: "))
            print(f"{num1} + {num2} = {add(num1, num2)}")
        
        elif choice == '2':
            num1 = float(input("Enter first number: "))
            num2 = float(input("Enter second number: "))
            print(f"{num1} - {num2} = {subtract(num1, num2)}")
        
        elif choice == '3':
            num1 = float(input("Enter first number: "))
            num2 = float(input("Enter second number: "))
            print(f"{num1} * {num2} = {multiply(num1, num2)}")
        
        elif choice == '4':
            num1 = float(input("Enter first number: "))
            num2 = float(input("Enter second number: "))
            print(f"{num1} / {num2} = {divide(num1, num2)}")
        
        elif choice == '5':
            num = float(input("Enter number to calculate square root: "))
            print(f"Square root of {num} = {square_root(num)}")
        
        elif choice == '6':
            num1 = float(input("Enter base number: "))
            num2 = float(input("Enter exponent: "))
            print(f"{num1} raised to the power of {num2} = {exponentiate(num1, num2)}")
        
        elif choice == '7':
            trig_func = input("Enter trigonometric function (sin, cos, tan): ").lower()
            angle = float(input("Enter angle in degrees: "))
            print(f"{trig_func}({angle}) = {trigonometric_function(trig_func, angle)}")
        
        elif choice == '8':
            print("Exiting the calculator. Goodbye!")
            break
        
        else:
            print("Invalid input! Please try again.")

# Run the calculator
calculator()
