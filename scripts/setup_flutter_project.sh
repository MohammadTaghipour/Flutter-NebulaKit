# #!/bin/bash

# # Load environment variables from .env file
# if [ -f .env ]; then
#   export $(cat .env | xargs)
# fi

# # Determine Flutter project path
# FLUTTER_PROJECT_PATH=${FLUTTER_PROJECT_PATH:-$(find . -name 'pubspec.yaml' -exec dirname {} \; | head -n 1)}

# # Print the Flutter project path
# echo "Flutter project path: $FLUTTER_PROJECT_PATH"

# # Set the Flutter project path as an environment variable
# export FLUTTER_PROJECT_PATH