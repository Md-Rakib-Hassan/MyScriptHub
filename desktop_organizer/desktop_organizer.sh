#!/bin/bash

# Define paths

desktop_path="/c/Users/Lenovo/OneDrive/Desktop"     # Change this path to your desktop path
organizer_base_path="/e"


organizer_path="$organizer_base_path/Desktop Files"
videos_path="$organizer_path/Videos"
documents_path="$organizer_path/Documents"
images_path="$organizer_path/Images"
music_path="$organizer_path/Music"
archives_path="$organizer_path/Archives"
others_path="$organizer_path/Others"
software_path="$organizer_path/Software"
codes_path="$organizer_path/Codes"
markdown_path="$organizer_path/Markdown"
json_path="$organizer_path/JSON"
photoshop_path="$organizer_path/Photoshop"
illustrator_path="$organizer_path/Illustrator"
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
    src="$1"
    dest_dir="$2"
    filename=$(basename "$src")
    base="${filename%.*}"
    ext="${filename##*.}"
    timestamp=$(date +"%d%m%y%I%M%p" | tr '[:lower:]' '[:upper:]') # Format like 0205251031AM

    # Handle files without extensions
    if [ "$base" = "$ext" ]; then
        ext=""
    else
        ext=".$ext"
    fi

    dest_file="$dest_dir/$filename"
    if [ -e "$dest_file" ]; then
        filename="${base}(${timestamp})${ext}"
        dest_file="$dest_dir/$filename"
    fi

    mkdir -p "$dest_dir"
    mv "$src" "$dest_file"
}

# Function to check and move folders
ck_mv_dir () {
    src="$1"
    dest_dir="$2"
    folder_name=$(basename "$src")
    timestamp=$(date +"%d%m%y%I%M%p" | tr '[:lower:]' '[:upper:]')
    dest_path="$dest_dir/$folder_name"

    if [ -e "$dest_path" ]; then
        folder_name="${folder_name}(${timestamp})"
        dest_path="$dest_dir/$folder_name"
    fi

    mkdir -p "$dest_dir"
    mv "$src" "$dest_path"
}

# Move all directories to Others Directory
find "$desktop_path" -mindepth 1 -maxdepth 1 -type d | while read -r dir; do
    [ "$dir" = "$organizer_path" ] && continue  # Prevent moving the organizer itself
    ck_mv_dir "$dir" "$others_dir"
done

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
        md) ck_mv "$file" "$markdown_path" ;;
        json) ck_mv "$file" "$json_path" ;;
        psd) ck_mv "$file" "$photoshop_path" ;;
        ai) ck_mv "$file" "$illustrator_path" ;;
        *) ck_mv "$file" "$others_path" ;;
    esac
done

# Remove empty folders in organizer_path
find "$organizer_path" -type d -empty -delete

echo "Process complete!"
