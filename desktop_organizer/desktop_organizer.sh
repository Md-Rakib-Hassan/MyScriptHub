#!/bin/bash

# Define paths

desktop_path="/c/Users/Lenovo/OneDrive/Desktop"     # Change this path to your desktop path



organizer_path="$desktop_path/Desktop Files"
videos_path="$organizer_path/Videos"
documents_path="$organizer_path/Documents"
images_path="$organizer_path/Images"
music_path="$organizer_path/Music"
archives_path="$organizer_path/Archives"
others_path="$organizer_path/Others"
software_path="$organizer_path/Software"
codes_path="$organizer_path/Codes"
others_dir="$organizer_path/Others Directory"

# Check if organizer_path directory exists or not
if [ ! -d "$organizer_path" ]; then

    # Create organizer directory and subdirectories
    mkdir -p "$videos_path"
    mkdir -p "$documents_path"
    mkdir -p "$images_path"
    mkdir -p "$music_path"
    mkdir -p "$archives_path"
    mkdir -p "$others_path"
    mkdir -p "$others_dir"
    mkdir -p "$software_path"
    mkdir -p "$codes_path"

fi

# Function to check and move files
ck_mv () {
    if [ -d $2 ]; then
        mv "$1" "$2"
    else
        mkdir -p "$2"
        mv "$1" "$2"
    fi
}

# Move all directories to Others Directory
find "$desktop_path" -mindepth 1 -maxdepth 1 -type d -exec mv -t "$others_dir" {} +

# Categorize files directly on desktop
find "$desktop_path" -mindepth 1 -maxdepth 1 -type f | while read -r file; do
    extension="${file##*.}"
    extension="${extension,,}"
    case "$extension" in
        mp4|mkv|avi|mov) ck_mv "$file" "$videos_path" ;;
        txt|doc|docx|pdf|csv|ppt|pptx) ck_mv "$file" "$documents_path" ;;
        jpg|jpeg|png|gif|bmp|svg|webp) ck_mv "$file" "$images_path" ;;
        mp3|wav|flac|amr) ck_mv "$file" "$music_path" ;;
        zip|tar|gz|bz2|rar) ck_mv "$file" "$archives_path" ;;
        sh|py|cpp|c|html|css|js|jsx|xml|dart)ck_mv "$file" "$codes_path" ;;
        exe|apk|msi) ck_mv "$file" "$software_path" ;;
        *) ck_mv "$file" "$others_path" ;;
    esac
done

# Remove empty folders in organizer_path
find "$organizer_path" -type d -empty -delete

echo "Process complete!"
