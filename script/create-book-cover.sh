#!/bin/bash

# Check if filename argument is provided
if [[ -z "$1" ]]; then
  echo "Usage: $0 <book_cover_image> [-o output_filename]"
  exit 1
fi

# Default output filename
output_filename="formatted-book-cover.png"

# Parse arguments for optional output filename
while [[ $# -gt 0 ]]; do
  case "$1" in
    -o)
      output_filename="$2"
      shift 2
      ;;
    *)
      input_filename="$1"
      shift
      ;;
  esac
done

# Step 1: Resize the book cover to 340px tall, maintaining aspect ratio
resized_cover="resized_cover.png"
magick "$input_filename" -resize x400 "$resized_cover"

# Step 2: Add a 10px white border around the resized book cover
framed_cover="framed_cover.png"
magick "$resized_cover" -bordercolor White -border 8x "$framed_cover"

# Step 3: Get the actual width and height of the framed cover (now including the 10px border)
cover_width=$(identify -format "%w" "$framed_cover")
cover_height=$(identify -format "%h" "$framed_cover")

# Step 4: Calculate the horizontal and vertical positions to center the framed cover
horizontal_position=$(( (900 - cover_width) / 2 ))
vertical_position=$(( (400 - cover_height) / 2 ))

# Step 5: Extract three prominent colors with attention to accent colors
# Downscale and reduce colors using k-means clustering to get distinctive tones
colors=($(magick "$input_filename" -resize 100x100 -colors 5 -unique-colors txt:- | grep -o '#\w\+'))

# Ensure three colors were successfully extracted
if [[ ${#colors[@]} -lt 3 ]]; then
  echo "Error: Unable to extract three prominent colors from the image."
  exit 1
fi

# Assign the colors for clarity
background_color1="${colors[0]}"
background_color2="${colors[1]}"
background_color3="${colors[2]}"

# Step 6: Create a linear gradient background from upper left to bottom right
gradient_background="gradient_background.png"
magick -size 1800x800 gradient:"$background_color1-$background_color2-$background_color3" \
  -rotate 25 "$gradient_background"

# Step 7: Overlay a white background with 80% opacity over the gradient
base_image="base.png"
magick -size 900x400 canvas:white \
  \( "$gradient_background" -compose over -gravity center -alpha set -channel Alpha -evaluate set 80 % \) -composite \
  "$base_image"

# Step 8: Overlay the framed book cover in the center of the base image
magick "$base_image" "$framed_cover" -geometry +${horizontal_position}+${vertical_position} -composite "$output_filename"

# Clean up intermediate files
rm "$resized_cover" "$framed_cover" "$gradient_background" "$base_image"

echo "Formatted book cover created as $output_filename"
