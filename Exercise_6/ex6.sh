#!/bin/bash

# Get two numbers as arguments (not equal)
if [ "$#" -ne 2 ] || [ "$1" -eq "$2" ]; then
  echo "Usage: $0 <number1> <number2> (numbers should not be equal)"
  exit 1
fi

# Initialize an array with script arguments
args=("$@")

# Find the smaller and larger numbers
if [ "$1" -lt "$2" ]; then
  smaller="$1"
  larger="$2"
else
  smaller="$2"
  larger="$1"
fi

# Initialize an array with the sequence between the arguments (not including the arguments)
sequence=()
for ((i=smaller+1; i<larger; i++)); do
  sequence+=("$i")
done

# Combine the new array with the args array
new_array=("Arguments are" "${args[@]}" "${sequence[@]}")

# Print the new array
echo "${new_array[@]}"
