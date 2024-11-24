#!/bin/bash

# Initialize variables with default values
aspect_ratio="1x1.7"
background_color=""
output_file="output.png"
binding_percentage=8

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
  echo "Usage: $0 image_file [-r aspect_ratio] [-bg background_color] [-o output_file] [-bp binding_percentage]"
  exit 1
fi

# Get the image file from the first positional argument
image_file="$1"
shift

# Check if input file exists
if [ ! -f "$image_file" ]; then
  echo "Error: File '$image_file' not found."
  exit 1
fi

# Parse options
while [ "$#" -gt 0 ]; do
  case "$1" in
    -r)
      if [ -n "$2" ]; then
        aspect_ratio="$2"
        shift 2
      else
        echo "Error: -r requires an aspect ratio value."
        exit 1
      fi
      ;;
    -bg)
      if [ -n "$2" ]; then
        background_color="$2"
        shift 2
      else
        echo "Error: -bg requires a background color value."
        exit 1
      fi
      ;;
    -o)
      if [ -n "$2" ]; then
        output_file="$2"
        shift 2
      else
        echo "Error: -o requires an output filename."
        exit 1
      fi
      ;;
    -bp)
      if [ -n "$2" ]; then
        binding_percentage="$2"
        shift 2
      else
        echo "Error: -bp requires a binding percentage value."
        exit 1
      fi
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: $0 image_file [-r aspect_ratio] [-bg background_color] [-o output_file] [-bp binding_percentage]"
      exit 1
      ;;
  esac
done

# Check if 'magick' command is available
if ! command -v magick &> /dev/null
then
  echo "Error: ImageMagick 'magick' command not found. Please install ImageMagick."
  exit 1
fi

# If background_color is not supplied, get a reasonable color from the image
if [ -z "$background_color" ]; then
  # Get average color in hex format
  background_color=$(magick "$image_file" -resize 1x1\! -format '%[hex:p{0,0}]' info:-)
  background_color="#$background_color"
fi

# Display the values being used
echo "Input Image: $image_file"
echo "Aspect Ratio: $aspect_ratio"
echo "Background Color: $background_color"
echo "Binding Percentage: $binding_percentage%"

# Get original image dimensions
dimensions=$(magick identify -format "%w %h" "$image_file")
orig_width=$(echo $dimensions | cut -d' ' -f1)
orig_height=$(echo $dimensions | cut -d' ' -f2)

# Parse aspect ratio
aspect_w=$(echo "$aspect_ratio" | cut -dx -f1)
aspect_h=$(echo "$aspect_ratio" | cut -dx -f2)

if [ -z "$aspect_w" ] || [ -z "$aspect_h" ]; then
  echo "Error: Invalid aspect ratio format. Use format like '4x3'."
  exit 1
fi

# Compute target aspect ratio R = aspect_w / aspect_h
R=$(echo "scale=10; $aspect_w / $aspect_h" | bc -l)

# Compute W_candidate and H_candidate
W_candidate=$(echo "scale=10; $orig_height * $R" | bc -l)
H_candidate=$(echo "scale=10; $orig_width / $R" | bc -l)

# Initialize W_new and H_new
W_new=$orig_width
H_new=$orig_height

# Decide whether to adjust width or height
if (( $(echo "$W_candidate >= $orig_width" | bc -l) )); then
  W_new=$(printf "%.0f" "$W_candidate")
elif (( $(echo "$H_candidate >= $orig_height" | bc -l) )); then
  H_new=$(printf "%.0f" "$H_candidate")
fi

# Ensure W_new and H_new are integers
W_new=$(printf "%.0f" "$W_new")
H_new=$(printf "%.0f" "$H_new")

# Use 'magick' to resize and extend the image
magick "$image_file" -resize "${W_new}x${H_new}\<" -background "$background_color" -gravity center -extent "${W_new}x${H_new}" "resized_image.png"

# Calculate the binding width in pixels
binding_width=$(echo "($binding_percentage * $W_new) / 100" | bc)
if [ "$binding_width" -lt 1 ]; then
  binding_width=1
fi

# Create the binding column image
magick -size ${binding_width}x${H_new} canvas:"$background_color" "binding_column.png"

# Append the binding column to the left of the resized image
magick "binding_column.png" "resized_image.png" +append "$output_file"

# Clean up temporary files
rm "resized_image.png" "binding_column.png"

echo "Output image saved as $output_file"
