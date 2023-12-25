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