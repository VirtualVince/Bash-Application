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