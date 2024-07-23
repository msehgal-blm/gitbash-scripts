# GitBash Scripts

## .bashrc
### Description
Copy of my .bashrc file, contains functions for faster Git usage and filesystem navigation.\
Main feature is the "@" function which allows quick navigation by attempting to match the supplied string to any directory within a depth of 3.\
Additionally, each function acts as a "cd" allowing input afterwards.

### Examples
Using "@": `workspace @ project` - this will navigate to /c/tmp/workspace and then to the first directory whose name contains "project".
