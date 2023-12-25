#Application Menu Interaction 

echo "Welcome to the Application!"

# Get user's name
read -p "Please enter your name: " username

echo "       "
echo "Hello, $username!"

 # Display menu
while true; do
    echo "       "
    echo "Application Menu:"
    echo "       "
    echo "A or 1) Find triangular numbers."
    echo "B or 2) Find numbers as the product of two even square numbers."
    echo "C or 3) Find the terms of a sequence."
    echo "D or 4) Exit."
	
    # Get user's choice
    read -p "Please enter your choice: " choice
	
	    case $choice in
        A | 1)
            # Task 1: Find triangular numbers
#gets input from user
read -p "Enter the start of range : " start
while ! is_number "$start"; do
	echo "Invalid input, please enter a vaild number"
	read -p "Enter the  start of range: " start
done

read -p "Enter the end of range :" end
while ! is_number "$end"; do
	echo "Invaild input, please enter a vaild number"
	read -p "Enter the  end of range: " end
done
 find_triangular_numbers $start $end
            ;;
        B | 2)
            # Task 2: Find numbers as the product of two even square numbers
# Get user input for the number of such numbers to print
read -p "Enter the number of numbers to print: " num_to_print

# Call the function to find and print numbers as the product of two even square numbers
find_even_square_products $num_to_print
            ;;
        C | 3)
		    # Task 3: Find terms of a sequence
			
# Get user input for positive integers a and b
read -p "Enter the value of a (positive integer): " a_value
while ! is_positive_integer "$a_value"; do
    read -p "Invalid input. Please enter a positive integer for a: " a_value
done

read -p "Enter the value of b (positive integer): " b_value
while ! is_positive_integer "$b_value"; do
    read -p "Invalid input. Please enter a positive integer for b: " b_value
done

# Get user input/options for sequence task
echo "Options for Sequence Task:"
echo "1) Find a limited number of terms and print them in order."
echo "2) Find a term in a position and check if it's a factor of another number."

read -p "Choose an option (1 or 2): " option

case $option in
    1)
        read -p "Enter the maximum number of terms to find: " max_terms
        while ! is_positive_integer "$max_terms"; do
            read -p "Invalid input. Please enter a positive integer for the maximum terms: " max_terms
        done
        find_terms_and_sum $a_value $b_value $max_terms
        ;;
    2)
        find_term_and_check_factor $a_value $b_value
        ;;
    *)
        echo "Invalid option. Please choose 1 or 2."
        ;;
esac
;;
        D | 4)
            # Exit the program
            echo "Exiting the Application. Goodbye, $username!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter A or 1, B or 2, C or 3, D or 4."
            ;;
    esac

    # Ask the user if they want to continue or exit
    read -p "Do you want to continue? (Y/N): " continue_choice
    if [ "$continue_choice" != "Y" ] && [ "$continue_choice" != "y" ]; then
        echo "Exiting the Application. Goodbye, $username!"
        exit 0
	fi
	done
    #!/bin/bash

#-------------Task 1 Start------------------
# Check is input is a number
is_number() {
	re='^[0-9]+$'
	if [[ $1 =~ $re ]]; then
		return 0
	else
		return 1
	fi
}
# Task 1: Find triangular numbers in a range and print multiples of 3
find_triangular_numbers() {
# Create variables
local start=$1
local end=$2
local count=0
local multiple_of_3_count=0

for ((i = start; i <= end; i++)); do
    # Calculate the number
    tri_num=$((i * (i + 1) / 2))

    # Check if the number is within range
    if ((tri_num >= start && tri_num <= end)); then
        ((count++))

        # Check if number is multiple of 3
        if ((tri_num % 3 == 0)); then
            ((multiple_of_3_count++))

            # Check if the triangular number is a multiple of 3
            echo $tri_num
        fi
    fi
done
#Prints counts
echo "Triangular numbers found: $count"
echo "Multiples of 3 found : $multiple_of_3_count"
}
#-------------Task 1   END------------------

#............Task2  start..............
# Function to check if a number is a perfect square
# Function to check if a number is even
is_even() {
    local num=$1
    if [ $((num % 2)) -eq 0 ]; then
        return 0  # Return success (true) for even numbers
    else
        return 1  # Return failure (false) for odd numbers
    fi
}

# Function to find numbers as the product of two even square numbers in succession
find_even_square_products() {
    local count=$1
    local current_count=0
    local number=2  # Starting with the first even square number (2^2)

    echo "Numbers as the product of two even square numbers in succession:"
    while [ $current_count -lt $count ]; do
        square1=$((number * number))
        square2=$((square1 * square1))  # The next even square number

        product=$((square1 * square2))

        if is_even $product; then
            echo "$product (even)"
            current_count=$((current_count + 1))
        else
            echo "$product (odd)"
        fi

        number=$((number + 1))
    done
}

#-------------Task 2   END------------------

#............Task3  start..............
# Function to check if input number is a positive integer
is_positive_integer() {
    local num=$1
    if [[ "$num" =~ ^[1-9][0-9]*$ ]]; then
        return 0  # Return success (true) for positive integers
    else
        return 1  # Return failure (false) for non-positive integers
    fi
}

# Function to calculate the sequence term based on the given rule
calculate_term() {
    local a=$1
    local b=$2
    local n=$3

    echo $((a * n * n * n + b * n))
}

# Function to find and print terms of a sequence up to a maximum chosen by the user
find_terms_and_sum() {
    local a=$1
    local b=$2
    local max_terms=$3
    local sum=0

    echo "Option 1: Find terms and sum"

    for ((n = 1; n <= max_terms; n++)); do
        term=$(calculate_term $a $b $n)
        echo "Term $n: $term"
        sum=$((sum + term))
    done

    echo "Sum of terms: $sum"
}

# Function to find a term in a position and check if it's a factor of another number
find_term_and_check_factor() {
    local a=$1
    local b=$2

    read -p "Enter the position of the term to find: " position

    # Validate the position input
    if ! is_positive_integer "$position"; then
        echo "Invalid input. Please enter a positive integer for the position."
        return
    fi

    read -p "Enter the number to check for factors: " check_factor

    # Validate the check_factor input
    if ! is_positive_integer "$check_factor"; then
        echo "Invalid input. Please enter a positive integer for the check factor."
        return
    fi

    term=$(calculate_term $a $b $position)

    echo "The $position term is $term."

    if [ $((check_factor % term)) -eq 0 ]; then
        echo "This term is a factor of $check_factor."
    else
        echo "This term is not a factor of $check_factor."
    fi
}
#............Task3  END..............