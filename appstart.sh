#Application Menu Interaction 

echo "Welcome to the Application!"

# Get user's name
read -p "Please enter your name: " username

echo "       "
echo "Hello, $username!"

 # Display menu
while true; do
    echo "       "
    echo "COMP1236 Group Project Menu:"
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
            echo "Exiting the COMP1236 Group Project Application. Goodbye, $username!"
            exit 0
            ;;
        *)
            echo "Invalid choice. Please enter A or 1, B or 2, C or 3, D or 4."
            ;;
    esac

    # Ask the user if they want to continue or exit
    read -p "Do you want to continue? (Y/N): " continue_choice
    if [ "$continue_choice" != "Y" ] && [ "$continue_choice" != "y" ]; then
        echo "Exiting the COMP1236 Group Project Application. Goodbye, $username!"
        exit 0
	fi
	done