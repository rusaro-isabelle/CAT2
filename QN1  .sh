QN1:  

#!/bin/bash

# Check if no arguments provided
if [ $# -ne 1 ]; then
    echo "Please provide exactly one positive integer as a command line argument."
    exit 1
fi

# Check if the argument is a number
if ! [[ $1 =~ ^[0-9]+$ ]]; then
    echo "The argument provided is not a valid positive integer."
    exit 1
fi

number=$1

# Function to calculate sum of digits
get_digit_sum() {
    local num=$1
    local sum=0
    while [ $num -gt 0 ]; do
        digit=$((num % 10))
        sum=$((sum + digit))
        num=$((num / 10))
    done
    echo $sum
}

# Function to calculate product of digits
get_digit_product() {
    local num=$1
    local product=1
    while [ $num -gt 0 ]; do
        digit=$((num % 10))
        product=$((product * digit))
        num=$((num / 10))
    done
    echo $product
}

# Function to check if the number is a palindrome
is_palindrome() {
    local num=$1
    local reversed=0
    local original=$num

    while [ $num -gt 0 ]; do
        digit=$((num % 10))
        reversed=$((reversed * 10 + digit))
        num=$((num / 10))
    done

    if [ $original -eq $reversed ]; then
        echo "$original is a palindrome."
    else
        echo "$original is not a palindrome."
    fi
}

# Function to check if the number is prime
is_prime() {
    local num=$1
    if [ $num -lt 2 ]; then
        echo "$num is not a prime number."
        return
    fi

    for ((i = 2; i <= num / 2; i++)); do
        if [ $((num % i)) -eq 0 ]; then
            echo "$num is not a prime number."
            return
        fi
    done

    echo "$num is a prime number."
}

# Perform the chosen operation
echo "Choose an operation:"
echo "1. Display the sum and product of the digits of the number."
echo "2. Display whether the number is a palindrome or not."
echo "3. Display whether the number is prime or not."
read choice

case $choice in
1)
    sum=$(get_digit_sum $number)
    product=$(get_digit_product $number)
    echo "Sum of digits: $sum"
    echo "Product of digits: $product"
    ;;
2)
    is_palindrome $number
    ;;
3)
    is_prime $number
    ;;
*)
    echo "Invalid choice. Please enter a valid option."
    ;;
esac


