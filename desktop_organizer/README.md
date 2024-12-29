# Desktop File Organizer

A simple bash script that organizes files on your desktop into categorized folders. This script helps you maintain a clean and clutter-free desktop by automatically moving files into respective directories based on their file types.

---

## Features

- Automatically organizes desktop files into folders:
  - **Videos**: `.mp4`, `.mkv`, `.avi`, `.mov`
  - **Documents**: `.txt`, `.doc`, `.docx`, `.pdf`, `.csv`, `.ppt`, `.pptx`
  - **Images**: `.jpg`, `.jpeg`, `.png`, `.gif`, `.bmp`, `.svg`, `.webp`
  - **Music**: `.mp3`, `.wav`, `.flac`, `.amr`
  - **Archives**: `.zip`, `.tar`, `.gz`, `.bz2`, `.rar`
  - **Codes**: `.sh`, `.py`, `.cpp`, `.c`, `.html`, `.css`, `.js`, `.jsx`, `.xml`, `.dart`
  - **Software**: `.exe`, `.apk`, `.msi`
  - **Others**: Any uncategorized files
  - **Others Directory**: Subdirectories on the desktop
- Removes empty folders after organizing.
- Easy to configure for your desktop path.

---

## Prerequisites

- **Operating System**: Linux or a Linux-like environment (e.g., Git Bash on Windows).
- **Bash**: Ensure bash is installed on your system.

---

## Installation

1. Clone the repository or download the script:
   ```bash
   git clone https://github.com/Md-Rakib-Hassan/MyScriptHub.git
   cd desktop_organizer
   ```

2. Make the script executable:
   ```bash
   chmod +x desktop_organizer.sh
   ```

3. Update the `desktop_path` variable in the script to your desktop's path.

---

## Usage

1. Run the script:
   ```bash
   ./desktop_organizer.sh
   ```
   or double click on the file and open with Git Bash.

2. The script will:
   - Create a directory named `Desktop Files` on your desktop.
   - Organize all files into subdirectories under `Desktop Files`.
   - Move all subdirectories on the desktop into an `Others Directory`.

3. View the organized files in their respective folders.

---

## Customization

- You can add or modify file extensions in the `case` block for categorization.
- Adjust the folder structure as needed by editing the `mkdir` commands.

