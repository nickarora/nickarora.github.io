#!/bin/bash

# Initialize variables
output_file=""
quality=80  # Default quality for WEBP and AVIF
max_height=400

# Check if at least one argument is provided
if [ $# -lt 1 ]; then
  echo "Usage: $0 input_image [-o output_base_name] [-mh max_height]"
  exit 1
fi

# Get the input image file
input_image="$1"
shift

# Check if input file exists
if [ ! -f "$input_image" ]; then
  echo "Error: File '$input_image' not found."
  exit 1
fi

# Parse options
while [ "$#" -gt 0 ]; do
  case "$1" in
    -o)
      if [ -n "$2" ]; then
        output_file="$2"
        shift 2
      else
        echo "Error: -o requires an output base name."
        exit 1
      fi
      ;;
    -mh)
      if [ -n "$2" ]; then
        max_height="$2"
        shift 2
      else
        echo "Error: -h requires a pixel value."
        exit 1
      fi
      ;;
    *)
      echo "Unknown option: $1"
      echo "Usage: $0 input_image [-o output_base_name]"
      exit 1
      ;;
  esac
done

# Check if 'magick' command is available
if ! command -v magick &>/dev/null; then
  echo "Error: ImageMagick 'magick' command not found. Please install ImageMagick with AVIF and WEBP support."
  exit 1
fi

# Determine output base name
if [ -z "$output_file" ]; then
  # Use "optimized-" prefix plus the input file name without extension as base name
  input_basename="${input_image##*/}"          # Extract filename from path
  input_basename_no_ext="${input_basename%.*}" # Remove extension
  output_base="optimized-${input_basename_no_ext}"
else
  output_base="$output_file"
fi

# Set output file names
output_webp="${output_base}.webp"
output_avif="${output_base}.avif"
output_png="${output_base}.png"

# Temporary file for processing
temp_image="temp_resized.png"

# Resize to 900 pixels wide and center-crop to 900x400 pixels, then apply sharpening
magick "$input_image" \
  -resize 900x \
  -gravity center \
  -crop 900x$max_height+0+0 +repage \
  -sharpen 0x1 \
  "$temp_image"

# Optimize and convert to WEBP
magick "$temp_image" \
  -strip \
  -quality "$quality" \
  -define webp:method=6 \
  -define webp:auto-filter=true \
  "$output_webp"

# Optimize and convert to AVIF
magick "$temp_image" \
  -strip \
  -quality "$quality" \
  "$output_avif"

# Optimize and convert to PNG
magick "$temp_image" \
  -strip \
  -define png:compression-filter=5 \
  -define png:compression-level=9 \
  -define png:compression-strategy=1 \
  -define png:exclude-chunk=all \
  "$output_png"

# Remove temporary file
rm "$temp_image"

echo "Optimized images saved as:"
echo " - $output_webp"
echo " - $output_avif"
echo " - $output_png"
