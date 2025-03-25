#!/bin/bash

# Directory containing the input files
BASE_DIR="./"
OUT_DIR="../videos/srt_segments/"

for VOLUME in {19..24}; do
  # Use a wildcard to match the input file with any suffix
  INPUT_FILE=$(ls "${BASE_DIR}segment_${VOLUME}"*.m4b.srt 2>/dev/null)
  
  # Check if the input file exists
  if [ -n "$INPUT_FILE" ]; then
    # Construct the output file name
    OUTPUT_FILE="${OUT_DIR}segment_${VOLUME}.srt"
    
    echo "Converting $INPUT_FILE to $OUTPUT_FILE..."
    
    # Run ffmpeg command
    mv "$INPUT_FILE" "$OUTPUT_FILE"
    
    # Check if the conversion succeeded
    if [ $? -eq 0 ]; then
      echo "Volume $VOLUME converted successfully."
    else
      echo "Error converting Volume $VOLUME."
    fi
  else
    echo "Input file for Volume $VOLUME not found. Skipping..."
  fi
done