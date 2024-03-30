## Script for Uploading Solved Problems in GitHub.

I created this script to simplifies the process of uploading solved problems to GitHub for me. By following these instructions, you also can effortlessly manage your solved problems repository.

### Prerequisites
- You need to have initialized your GitHub repository.
- Connect your repository with the local folder where you store your solved problems.

### Instructions
1. **Setup**:
   - Place the provided script in the folder where your solved problems are stored.
   - Ensure your repository is correctly initialized and connected with this folder.

2. **Usage**:
   - After solving problem, simply double-click on the script.
   - The script will automatically upload all untracked `.cpp` files, committing them with their respective names.

### Example
Suppose you've solved three problems: `problem1.cpp`, `problem2.cpp`, and `problem3.cpp`. After running the script, the commit messages will be:
- `Solved problem1`
- `Solved problem2`
- `Solved problem3`

### File Naming Convention  
- You must adhere to certain naming conventions: 
	 - File names cannot contain spaces; instead, use camelCase or snake_case.
	 - File extensions must be `.cpp`.
	 - If you're using a different programming language, you may need to modify the script accordingly.
  

### Notes
- This script streamlines the process of managing solved problems on GitHub, making it easier to track your progress.
- Ensure your solved problems are stored in the designated folder before running the script.
