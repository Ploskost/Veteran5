#!/bin/bash

# Define the paths to the exercise folders
EXERCISE_PATHS=(
    "/home/sls/GitHub/veteran5/Exercise_1"
    "/home/sls/GitHub/veteran5/Exercise_2"
    "/home/sls/GitHub/veteran5/Exercise_3"
    "/home/sls/GitHub/veteran5/Exercise_4"
    "/home/sls/GitHub/veteran5/Exercise_5"
    "/home/sls/GitHub/veteran5/Exercise_6"
)

# Function to execute an exercise script
execute_exercise() {
    local exercise_number="$1"
    local exercise_script="$2"
    shift 2

    # Check if the exercise number is valid
    if [[ "$exercise_number" -ge 1 && "$exercise_number" -le 6 ]]; then
        local exercise_folder="${EXERCISE_PATHS[exercise_number - 1]}"
        local full_path="$exercise_folder/$exercise_script"

        # Execute the exercise script with provided arguments
        if [[ -f "$full_path" ]]; then
            bash "$full_path" "$@"
        else
            echo "Error: Exercise script '$exercise_script' not found in $exercise_folder."
            exit 1
        fi
    else
        echo "Error: Invalid exercise number. Please choose a number between 1 and 6."
        exit 1
    fi
}

# Parse command-line options using getopts
while getopts ":123456" OPTION; do
    case "$OPTION" in
        1|2|3|4|5|6)
            exercise_number="$OPTION"
            ;;
        \?)
            echo "Usage: $(basename "$0") -[1-6] [Arguments relevant for the task chosen...]"
            exit 1
            ;;
    esac
done
shift $((OPTIND - 1))

# Execute the selected exercise script
if [[ -n "$exercise_number" ]]; then
    execute_exercise "$exercise_number" "$@"
else
    echo "Usage: $(basename "$0") -[1-6] [Arguments relevant for the task chosen...]"
    exit 1
fi

