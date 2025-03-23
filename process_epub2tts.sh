#!/bin/bash

# Base command options
BASE_COMMAND="epub2tts"
ENGINE_OPTION="--engine kokoro"
SPEAKER_OPTION="--speaker am_michael"
SPEED_OPTION="--speed 1.0"

# Directory containing the input files
BASE_DIR="./txt/s_classes_that_i_raised/"

# Starting volume number
START_VOLUME=9

# Loop through the desired volume numbers
for VOLUME in {01..06}; do
  # Construct the input file name
  INPUT_FILE="${BASE_DIR}segment_${VOLUME}.txt"
  
  # Check if the input file exists
  if [ -f "$INPUT_FILE" ]; then
    echo "Processing $INPUT_FILE..."
    
    # Run the command
    $BASE_COMMAND "$INPUT_FILE" $ENGINE_OPTION $SPEAKER_OPTION $SPEED_OPTION
    
    # Check if the command succeeded
    if [ $? -eq 0 ]; then
      echo "Volume $VOLUME processed successfully."
    else
      echo "Error processing Volume $VOLUME."
    fi
    
    # Sleep for a few seconds, if needed (optional)
    echo "Waiting for the next volume..."
  else
    echo "Input file $INPUT_FILE not found. Skipping..."
  fi
done

echo "All volumes processed."