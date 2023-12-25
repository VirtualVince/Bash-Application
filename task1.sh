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

