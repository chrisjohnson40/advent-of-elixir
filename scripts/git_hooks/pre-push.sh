#!/bin/bash

# Run `mix credo` and `mix test` before pushing changes

# Command to run `mix credo`
MIX_CREDO_COMMAND="mix credo --strict"

# Command to run `mix test`
MIX_TEST_COMMAND="mix test"

# Run `mix credo`
echo "Running mix credo..."
$MIX_CREDO_COMMAND

# Check if `mix credo` failed
if [ $? -ne 0 ]; then
    echo "mix credo failed, please fix code style issues"
    exit 1
fi

# Run `mix test`
echo "Running mix test..."
$MIX_TEST_COMMAND

# Check if `mix test` failed
if [ $? -ne 0 ]; then
    echo "mix test failed, please fix failing tests"
    exit 1
fi

# If everything is okay
exit 0
