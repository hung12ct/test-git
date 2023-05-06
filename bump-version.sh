#!/bin/bash

# Get the current version from the __version__ variable in your project's version file.
VERSION=$(python -c "exec(open('my_project/version.py').read()); print(__version__)")

# Split the version into major, minor, and patch components.
MAJOR=$(echo $VERSION | cut -d '.' -f 1)
MINOR=$(echo $VERSION | cut -d '.' -f 2)
PATCH=$(echo $VERSION | cut -d '.' -f 3)

# Increment the appropriate version component based on the command-line argument.
if [ "$1" = "major" ]; then
    MAJOR=$((MAJOR + 1))
    MINOR=0
    PATCH=0
elif [ "$1" = "minor" ]; then
    MINOR=$((MINOR + 1))
    PATCH=0
elif [ "$1" = "patch" ]; then
    PATCH=$((PATCH + 1))
else
    echo "Usage: $0 {major|minor|patch}"
    exit 1
fi

# Update the version file with the new version number.
echo "__version__ = \"$MAJOR.$MINOR.$PATCH\"" > my_project/version.py

# Print the new version number.
echo "Version bumped to $MAJOR.$MINOR.$PATCH"
