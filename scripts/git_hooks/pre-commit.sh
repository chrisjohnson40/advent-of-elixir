#!/bin/bash

# Run `mix format` for Elixir files staged for commit

# Command to run `mix format`
MIX_FORMAT_COMMAND="mix format --check-formatted"

# Get staged Elixir files
STAGED_ELIXIR_FILES=$(git diff --cached --name-only --diff-filter=ACM -- '*.ex' '*.exs')

# Check if there are staged Elixir files
if [ -n "$STAGED_ELIXIR_FILES" ]; then
    echo "Running mix format..."
    # Run `mix format` for staged files
    $MIX_FORMAT_COMMAND $STAGED_ELIXIR_FILES
    # Get exit status of the command
    STATUS=$?
    # If `mix format` command fails
    if [ $STATUS -ne 0 ]; then
        echo "mix format failed, please fix formatting issues"
        exit 1
    fi
fi

# If everything is okay
exit 0